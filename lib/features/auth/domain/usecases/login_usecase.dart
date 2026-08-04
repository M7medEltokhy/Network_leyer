import 'package:injectable/injectable.dart';
import '../../data/models/login_request.dart';
import '../entities/login_result.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  Future<LoginResult> call(LoginRequest request) {
    return repository.login(request);
  }
}