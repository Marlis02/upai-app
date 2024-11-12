import 'package:bloc/bloc.dart';
import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_enent.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;

  AuthBloc(this.authServices) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var res = await authServices.login(event.email, event.password);
        emit(AuthSuccess(res));
      } catch (e) {
        emit(AuthError('Ошибка: ${e.toString()}'));
      }
    });
  }
}
