import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ctmax_upai/models/account.dart';
import 'package:ctmax_upai/service_locator.dart';
import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_event.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_state.dart';
import 'package:ctmax_upai/utils/constants.dart';
import 'package:ctmax_upai/utils/shared_prefs.dart';
import 'package:flutter/painting.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  AuthServices authServices = locator<AuthServices>();

  AuthLoginBloc() : super(AuthLoginInitial()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoginLoading());
      try {
        var res = await authServices.login(event.email, event.password);
        await setPrefs(PREF_TOKEN_KEY, jsonEncode(res));
        emit(AuthLoginSuccess(res));
      } catch (e) {
        emit(AuthLoginError('Ошибка: ${e.toString()}'));
      }
    });
  }
}
