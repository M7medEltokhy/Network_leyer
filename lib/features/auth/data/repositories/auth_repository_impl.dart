import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/base_response.dart';
import 'package:network_leyer/core/network/safe_api_call.dart';
import 'package:network_leyer/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:network_leyer/features/auth/domain/repositories/auth_repository.dart';
import 'package:network_leyer/features/auth/data/models/login_data.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<LoginData>> login(LoginRequest request) {
    return safeApiCall(() => remoteDataSource.login(request));
  }
}