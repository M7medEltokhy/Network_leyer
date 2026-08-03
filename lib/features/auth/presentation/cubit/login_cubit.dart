import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/features/auth/domain/repositories/auth_repository.dart';
import 'package:network_leyer/features/auth/presentation/cubit/login_state.dart';
import '../../data/models/login_request.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
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
      if (response.success) {
        emit(LoginSuccess(response.message, response.data));
      } else {
        emit(LoginFailure(response.message));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
