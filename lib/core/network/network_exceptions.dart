import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

class NetworkExceptions {
  static AppException handle(Object error) {
    if (error is DioException) {
      final data = error.response?.data;

      if (data is Map<String, dynamic> && data['message'] != null) {
        return AppException(data['message'].toString());
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const AppException('Connection timeout, please try again');
        case DioExceptionType.connectionError:
          return const AppException('No internet connection');
        default:
          return const AppException('Something went wrong');
      }
    }
    return const AppException('Unexpected error occurred');
  }
}
