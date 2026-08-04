import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/base_response.dart';
import 'package:network_leyer/features/auth/data/datasources/auth_api_client.dart';
import 'package:network_leyer/features/auth/data/models/login_data.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';

@lazySingleton
class AuthRemoteDataSource {
  final AuthApiClient authApiClient;
  const AuthRemoteDataSource(this.authApiClient);

  Future<BaseResponse<LoginData>> login(LoginRequest request) {
    return authApiClient.login(request);
  }
}