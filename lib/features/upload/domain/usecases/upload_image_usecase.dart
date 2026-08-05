import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../repos/upload_repo.dart';

@injectable
class UploadImageUseCase {
  final UploadRepo repo;
  const UploadImageUseCase(this.repo);

  Future<String> call(
    XFile file, {
    required void Function(int sent, int total) onProgress,
    required CancelToken cancelToken,
  }) {
    return repo.uploadImage(
      file,
      path: 'users',
      onProgress: onProgress,
      cancelToken: cancelToken,
    );
  }
}
