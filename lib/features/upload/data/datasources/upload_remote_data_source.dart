import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/base_response.dart';
import '../../../../core/network/retrofit/upload_api_service.dart';
import '../models/upload_file_response.dart';

@lazySingleton
class UploadRemoteDataSource {
  final UploadApiService _apiService;
  UploadRemoteDataSource(this._apiService);

  Future<BaseResponse<UploadFileResponse>> uploadSingleImage(
    XFile file, {
    String folderPath = 'users',
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final multipartFile = await MultipartFile.fromFile(
      file.path,
      filename: file.name,
    );
    return _apiService.uploadImages(
      folderPath,
      [multipartFile],
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }
}