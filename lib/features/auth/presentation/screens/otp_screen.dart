import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/custom_text.dart';
import '../cubit/otp_cubit.dart';
import '../cubit/otp_state.dart';

class OtpScreen extends StatelessWidget {
  final String phone;
  final String countryCode;

  const OtpScreen({super.key, required this.phone, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OtpCubit>(),
      child: _OtpView(phone: phone, countryCode: countryCode),
    );
  }
}

class _OtpView extends StatefulWidget {
  final String phone;
  final String countryCode;

  const _OtpView({required this.phone, required this.countryCode});

  @override
  State<_OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<_OtpView> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OtpCubit, OtpState>(
        listenWhen: (previous, current) =>
            previous.resendStatus != current.resendStatus,
        listener: (context, state) {
          if (state.resendStatus == RequestStatus.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(customSnackBar('Code resent', color: Colors.green));
          } else if (state.resendStatus == RequestStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(state.errorMessage ?? '', color: Colors.red),
            );
          }
        },
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: -60,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 8),
                      const CustomText(
                        text: 'Verify Code',
                        size: 26,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 230),
                  CustomText(
                    text:
                        'Enter the code sent to ${widget.countryCode}${widget.phone}',
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 24),
                  Pinput(
                    controller: _otpController,
                    length: 6,
                    keyboardType: TextInputType.number,
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade500,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    errorPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade500,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  BlocBuilder<OtpCubit, OtpState>(
                    buildWhen: (previous, current) =>
                        previous.canResend != current.canResend ||
                        previous.remainingSeconds != current.remainingSeconds,
                    builder: (context, state) {
                      return state.canResend
                          ? TextButton(
                              onPressed: () {
                                context.read<OtpCubit>().resendCode(
                                  phone: widget.phone,
                                  countryCode: widget.countryCode,
                                );
                              },
                              child: const Text(
                                'Resend Code',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Text(
                              'Resend available in ${state.remainingSeconds}s',
                              style: const TextStyle(color: Colors.grey),
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
