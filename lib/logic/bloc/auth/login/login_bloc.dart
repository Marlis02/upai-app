import 'package:bloc/bloc.dart';
import 'package:ctmax_upai/service_locator.dart';
import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_event.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  AuthServices authServices = locator<AuthServices>();

  AuthLoginBloc() : super(AuthLoginInitial()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoginLoading());
      try {
        var res = await authServices.login(event.email, event.password);
        emit(AuthLoginSuccess(res));
      } catch (e) {
        emit(AuthLoginError('Ошибка: ${e.toString()}'));
      }
    });
  }
}
