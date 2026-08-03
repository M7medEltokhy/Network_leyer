import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/api_endpoints.dart';
import '../network/interceptors/connectivity_interceptor.dart';
import '../network/retrofit/api_service.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  Dio dio(ConnectivityInterceptor connectivityInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          "X-SECRET-KEY": ApiEndpoints.secretKey,
        },
      ),
    )
      ..interceptors.add(connectivityInterceptor)
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}