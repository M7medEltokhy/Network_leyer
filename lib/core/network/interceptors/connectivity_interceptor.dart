import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../network_info.dart';

@injectable
class ConnectivityInterceptor extends Interceptor {
  final NetworkInfo networkInfo;

  ConnectivityInterceptor(this.networkInfo);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!await networkInfo.isConnected) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'لا يوجد اتصال بالإنترنت',
        ),
      );
    }
    handler.next(options);
  }
}