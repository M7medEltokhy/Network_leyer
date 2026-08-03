import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/api_endpoints.dart';
import 'package:network_leyer/core/network/network_info.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(NetworkInfo networkInfo) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          "X-SECRET-KEY": "TICKETS-NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3",
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!await networkInfo.isConnected) {
            return handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
                error: 'لا يوجد اتصال بالإنترنت',
              ),
            );
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}
