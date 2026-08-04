import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/features/auth/domain/usecases/login_usecase.dart';
import 'package:network_leyer/features/auth/presentation/cubit/login_state.dart';
import '../../data/models/login_request.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(const LoginState.initial());

  Future<void> login({
    required String phone,
    required String countryCode,
  }) async {
    emit(const LoginState.loading());
    try {
      final result = await loginUseCase(
        LoginRequest(phone: phone, countryCode: countryCode),
      );
      emit(LoginState.success(result));
    } catch (e) {
      emit(LoginState.failure(e.toString()));
    }
  }
}