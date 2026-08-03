import 'package:network_leyer/core/network/base_response.dart';
import 'package:network_leyer/features/auth/data/models/login_data.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginData>> login(LoginRequest request);
}