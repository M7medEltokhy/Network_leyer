import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../data/models/login_request.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

const int _resendDurationSeconds = 60;

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  Timer? _resendTimer;

  LoginCubit(this.loginUseCase) : super(const LoginState());

  Future<void> login({
    required String phone,
    required String countryCode,
  }) async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      final result = await loginUseCase(
        LoginRequest(phone: phone, countryCode: countryCode),
      );
      emit(state.copyWith(
        status: RequestStatus.success,
        loginResult: result,
        message: result.message,
      ));
      _startResendCountdown();
    } catch (e) {
      emit(state.copyWith(
        status: RequestStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _startResendCountdown() {
    _resendTimer?.cancel(); 

    emit(state.copyWith(
      remainingSeconds: _resendDurationSeconds,
      canResend: false,
    ));

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remaining = state.remainingSeconds - 1;

      if (remaining <= 0) {
        timer.cancel();
        emit(state.copyWith(remainingSeconds: 0, canResend: true));
      } else {
        emit(state.copyWith(remainingSeconds: remaining));
      }
    });
  }

  Future<void> resendCode({
    required String phone,
    required String countryCode,
  }) async {
    if (!state.canResend) return; 

    await login(phone: phone, countryCode: countryCode);
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}