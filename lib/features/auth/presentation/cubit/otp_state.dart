import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/enums/enums.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState({
    @Default(RequestStatus.initial) RequestStatus resendStatus,
    @Default(60) int remainingSeconds,
    @Default(false) bool canResend,
    String? errorMessage,
    String? resendMessage,
  }) = _OtpState;
}