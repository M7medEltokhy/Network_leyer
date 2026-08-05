import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../domain/entities/upload_item.dart';
import '../../domain/usecases/upload_image_usecase.dart';
import 'upload_state.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {
  final UploadImageUseCase uploadImageUseCase;
  final ImagePicker _picker = ImagePicker();
  final Map<String, CancelToken> _cancelTokens = {};

  UploadCubit(this.uploadImageUseCase) : super(const UploadState());

  String _generateId() => '${DateTime.now().microsecondsSinceEpoch}';

  Future<void> pickMultipleFromGallery() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles.isEmpty) return;

    final newItems = pickedFiles
        .map((f) => UploadItem(id: _generateId(), file: f))
        .toList();

    emit(state.copyWith(items: [...state.items, ...newItems]));

    for (final item in newItems) {
      _uploadItem(item);
    }
  }

  Future<void> pickSingleFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;

    final item = UploadItem(id: _generateId(), file: pickedFile);
    emit(state.copyWith(items: [...state.items, item]));
    _uploadItem(item);
  }

  Future<void> _uploadItem(UploadItem item) async {
    final cancelToken = CancelToken();
    _cancelTokens[item.id] = cancelToken;

    _updateItem(item.id, status: UploadItemStatus.uploading, progress: 0);

    try {
      await uploadImageUseCase(
        item.file,
        onProgress: (sent, total) {
          if (total <= 0) return;
          final percent = ((sent / total) * 100).round();
          _updateItem(item.id, progress: percent);
        },
        cancelToken: cancelToken,
      );

      _updateItem(item.id, status: UploadItemStatus.success, progress: 100);
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        _updateItem(item.id, status: UploadItemStatus.cancelled);
      } else {
        _updateItem(item.id, status: UploadItemStatus.failed, errorMessage: e.toString());
      }
    } catch (e) {
      _updateItem(item.id, status: UploadItemStatus.failed, errorMessage: e.toString());
    } finally {
      _cancelTokens.remove(item.id);
    }
  }

  void cancelUpload(String id) {
    _cancelTokens[id]?.cancel('Cancelled by user');
  }

  void removeItem(String id) {
    cancelUpload(id);
    emit(state.copyWith(
      items: state.items.where((i) => i.id != id).toList(),
    ));
  }

  void clearAll() {
    for (final token in _cancelTokens.values) {
      token.cancel('Cleared by user');
    }
    _cancelTokens.clear();
    emit(state.copyWith(items: []));
  }

  void _updateItem(String id, {int? progress, UploadItemStatus? status, String? errorMessage}) {
    final updated = state.items.map((item) {
      if (item.id != id) return item;
      return item.copyWith(progress: progress, status: status, errorMessage: errorMessage);
    }).toList();
    emit(state.copyWith(items: updated));
  }
}