import '../../../core/network/network_exceptions.dart';
import '../../../core/network/retrofit/api_service.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepo {
  final ApiService apiService;

  const AuthRepo(this.apiService);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      return await apiService.login(request);
    } catch (e) {
      throw NetworkExceptions.handle(e);
    }
  }
}