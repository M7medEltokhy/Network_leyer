import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/network_exceptions.dart';
import 'package:network_leyer/core/network/safe_api_call.dart';
import 'package:network_leyer/features/auth/data/datasources/auth_api_client.dart';
import 'package:network_leyer/features/auth/domain/entities/login_result.dart';
import 'package:network_leyer/features/auth/domain/repositories/auth_repository.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient authApiClient;
  const AuthRepositoryImpl(this.authApiClient);

  @override
  Future<LoginResult> login(LoginRequest request) async {
    final response = await safeApiCall(
      () => authApiClient.login(request.toJson()),
    );

    if (!response.success) {
      throw AppException(response.message);
    }

    return LoginResult(
      redirectTo: response.data!.redirectTo,
      message: response.message,
    );
  }
}
