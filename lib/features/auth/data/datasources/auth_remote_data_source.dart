import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/base_response.dart';
import 'package:network_leyer/core/network/retrofit/api_service.dart';
import 'package:network_leyer/features/auth/data/models/login_data.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';

@lazySingleton
class AuthRemoteDataSource {
  final ApiService apiService;
  const AuthRemoteDataSource(this.apiService);

  Future<BaseResponse<LoginData>> login(LoginRequest request) {
    return apiService.login(request);
  }
}