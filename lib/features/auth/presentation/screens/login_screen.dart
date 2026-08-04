import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_leyer/core/di/injector.dart';
import 'package:network_leyer/core/utils/enums/enums.dart';
import 'package:network_leyer/core/widgets/custom_snack_bar.dart';
import 'package:network_leyer/core/widgets/custom_text.dart';
import 'package:network_leyer/features/auth/presentation/cubit/login_cubit.dart';
import 'package:network_leyer/features/auth/presentation/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+20';
  final List<String> _countryCodes = [
    '+20',
    '+966',
    '+971',
    '+965',
    '+973',
    '+974',
    '+968',
  ];

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == RequestStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                state.loginResult?.message ?? state.message ?? '',
                color: Colors.green,
              ),
            );
          } else if (state.status == RequestStatus.failure) {
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
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    const CustomText(
                      text: 'Welcome Back',
                      size: 30,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 6),
                    const CustomText(
                      text: 'Sign in to continue to your account',
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 75),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: DropdownButtonFormField<String>(
                            initialValue: _selectedCountryCode,
                            decoration: const InputDecoration(
                              labelText: 'Country Code',
                              border: OutlineInputBorder(),
                            ),
                            items: _countryCodes
                                .map(
                                  (code) => DropdownMenuItem(
                                    value: code,
                                    child: Text(code),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() => _selectedCountryCode = value!);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone number is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final isLoading = state.status == RequestStatus.loading;
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade500,
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (!_formKey.currentState!.validate())
                                      return;
                                    context.read<LoginCubit>().login(
                                      phone: _phoneController.text.trim(),
                                      countryCode: _selectedCountryCode,
                                    );
                                  },
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
