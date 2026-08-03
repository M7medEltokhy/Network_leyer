import 'package:network_leyer/features/auth/data/models/login_data.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  final LoginData? data;
  const LoginSuccess(this.message, this.data);
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);
}
