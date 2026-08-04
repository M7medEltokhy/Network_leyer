import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../data/models/login_request.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
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
    } catch (e) {
      emit(state.copyWith(
        status: RequestStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}