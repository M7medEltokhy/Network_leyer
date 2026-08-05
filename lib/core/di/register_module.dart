import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/retrofit/upload_api_service.dart';
import 'package:network_leyer/features/auth/data/datasources/auth_api_client.dart';

import '../network/api_endpoints.dart';
import '../network/interceptors/connectivity_interceptor.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  Dio dio(ConnectivityInterceptor connectivityInterceptor) {
    final dio =
        Dio(
            BaseOptions(
              baseUrl: ApiEndpoints.baseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
              contentType: Headers.jsonContentType,
              headers: {
                Headers.acceptHeader: Headers.jsonContentType,
                "X-SECRET-KEY": ApiEndpoints.secretKey,
              },
            ),
          )
          ..interceptors.add(connectivityInterceptor)
          ..interceptors.add(
            LogInterceptor(requestBody: true, responseBody: true),
          );
    return dio;
  }

  @lazySingleton
  AuthApiClient authApiClient(Dio dio) => AuthApiClient(dio);

  @lazySingleton
  UploadApiService uploadApiService(Dio dio) => UploadApiService(dio);
}
