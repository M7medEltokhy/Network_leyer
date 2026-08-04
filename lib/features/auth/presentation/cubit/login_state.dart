// features/auth/presentation/cubit/login_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/entities/login_result.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(RequestStatus.initial) RequestStatus status,
    String? message,
    String? errorMessage,
    LoginResult? loginResult,
  }) = _LoginState;
}