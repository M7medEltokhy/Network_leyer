import 'package:network_leyer/features/auth/data/models/login_request.dart';
import 'package:network_leyer/features/auth/domain/entities/login_result.dart';

abstract class AuthRepository {
  Future<LoginResult> login(LoginRequest request);
}