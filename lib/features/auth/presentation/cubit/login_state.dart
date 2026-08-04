import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_leyer/features/auth/domain/entities/login_result.dart';
import '../../../../core/utils/enums/enums.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(RequestStatus.initial) RequestStatus status,
    String? message,
    String? errorMessage,
    LoginResult? loginResult,
    @Default(0) int remainingSeconds,
    @Default(true) bool canResend,
  }) = _LoginState;
}