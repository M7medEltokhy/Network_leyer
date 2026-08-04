import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/login_result.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success(LoginResult result) = LoginSuccess;
  const factory LoginState.failure(String message) = LoginFailure;
}
