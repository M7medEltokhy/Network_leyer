import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/features/auth/cubit/login_state.dart';
import 'package:network_leyer/features/auth/repo/auth_repo.dart';
import '../models/login_request.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login({
    required String phone,
    required String countryCode,
  }) async {
    emit(LoginLoading());
    try {
      final response = await authRepository.login(
        LoginRequest(phone: phone, countryCode: countryCode),
      );
      emit(LoginSuccess(response.message));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}