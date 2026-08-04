import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/network_exceptions.dart';
import 'package:network_leyer/core/network/safe_api_call.dart';
import 'package:network_leyer/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:network_leyer/features/auth/domain/entities/login_result.dart';
import 'package:network_leyer/features/auth/domain/repositories/auth_repository.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResult> login(LoginRequest request) async {
    final response = await safeApiCall(() => remoteDataSource.login(request));

    if (!response.success) {
      throw AppException(response.message);
    }

    return LoginResult(
      redirectTo: response.data!.redirectTo,
      message: response.message,
    );
  }
}
