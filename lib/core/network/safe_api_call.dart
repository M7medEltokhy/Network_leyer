import 'package:flutter/foundation.dart';
import 'network_exceptions.dart';

Future<T> safeApiCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } catch (e, stackTrace) {
    debugPrint('REAL ERROR: $e');
    debugPrint('STACK: $stackTrace');
    throw NetworkExceptions.handle(e);
  }
}
