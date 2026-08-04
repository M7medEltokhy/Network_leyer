import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../auth/data/models/login_request.dart';
import '../../../auth/domain/usecases/login_usecase.dart';
import 'otp_state.dart';

const int _resendDurationSeconds = 60;

@injectable
class OtpCubit extends Cubit<OtpState> {
  final LoginUseCase loginUseCase;
  Timer? _resendTimer;

  OtpCubit(this.loginUseCase) : super(const OtpState()) {
    startCountdown(); 
  }

  void startCountdown() {
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

    emit(state.copyWith(resendStatus: RequestStatus.loading));
    try {
      final result = await loginUseCase(
        LoginRequest(phone: phone, countryCode: countryCode),
      );
      emit(state.copyWith(
        resendStatus: RequestStatus.success,
        resendMessage: result.message,
      ));
      startCountdown();
    } catch (e) {
      emit(state.copyWith(
        resendStatus: RequestStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}