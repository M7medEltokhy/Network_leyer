import 'package:injectable/injectable.dart';
import '../../data/models/login_request.dart';
import '../../data/models/login_data.dart';
import '../../../../core/network/base_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  Future<BaseResponse<LoginData>> call(LoginRequest request) {
    return repository.login(request);
  }
}