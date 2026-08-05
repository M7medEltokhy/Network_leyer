import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../domain/repos/upload_repo.dart';
import '../datasources/upload_remote_data_source.dart';

@LazySingleton(as: UploadRepo)
class UploadRepoImpl implements UploadRepo {
  final UploadRemoteDataSource remoteDataSource;
  const UploadRepoImpl(this.remoteDataSource);

  @override
  Future<String> uploadImage(
    XFile file, {
    required String path,
    required void Function(int sent, int total) onProgress,
    required CancelToken cancelToken,
  }) async {
    try {
      final response = await remoteDataSource.uploadSingleImage(
        file,
        folderPath: path,
        onSendProgress: onProgress,
        cancelToken: cancelToken,
      );

      if (!response.success || response.data == null || response.data!.files.isEmpty) {
        throw AppException(
          response.message.isNotEmpty ? response.message : 'Upload failed',
        );
      }

      return response.data!.files.first.url;
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) rethrow;
      throw NetworkExceptions.handle(e);
    }
  }
}