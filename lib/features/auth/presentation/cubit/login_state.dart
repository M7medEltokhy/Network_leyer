import 'package:network_leyer/features/auth/domain/entities/login_result.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResult result;
  const LoginSuccess(this.result);
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);
}
