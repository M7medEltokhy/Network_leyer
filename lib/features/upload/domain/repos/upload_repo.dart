import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class UploadRepo {
  Future<String> uploadImage(
    XFile file, {
    required String path,
    required void Function(int sent, int total) onProgress,
    required CancelToken cancelToken,
  });
}