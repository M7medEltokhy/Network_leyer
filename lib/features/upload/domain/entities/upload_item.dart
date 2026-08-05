import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/enums/enums.dart';

class UploadItem {
  final String id;
  final XFile file;
  final int progress;
  final UploadItemStatus status;
  final String? errorMessage;

  const UploadItem({
    required this.id,
    required this.file,
    this.progress = 0,
    this.status = UploadItemStatus.pending,
    this.errorMessage,
  });

  UploadItem copyWith({
    int? progress,
    UploadItemStatus? status,
    String? errorMessage,
  }) {
    return UploadItem(
      id: id,
      file: file,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}