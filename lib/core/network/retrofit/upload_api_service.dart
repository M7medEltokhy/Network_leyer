import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../api_endpoints.dart';
import '../base_response.dart';
import '../../../features/upload/data/models/upload_file_response.dart';

part 'upload_api_service.g.dart';

@RestApi()
abstract class UploadApiService {
  factory UploadApiService(Dio dio) = _UploadApiService;

  @MultiPart()
  @POST(ApiEndpoints.uploadFile)
  Future<BaseResponse<UploadFileResponse>> uploadImages(
    @Part(name: "path") String path,
    @Part(name: "image[]") List<MultipartFile> images, {
    @SendProgress() ProgressCallback? onSendProgress,
    @CancelRequest() CancelToken? cancelToken,
  });
}