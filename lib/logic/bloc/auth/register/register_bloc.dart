import 'package:ctmax_upai/service_locator.dart';
import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/logic/bloc/auth/register/register_event.dart';
import 'package:ctmax_upai/logic/bloc/auth/register/register_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRegisterBloc extends Bloc<AuthRegisterEvent, AuthRegisterState> {
  AuthServices authServices = locator<AuthServices>();
  AuthRegisterBloc() : super(AuthRegisterInitial()) {
    on<AuthRegisterRequest>((event, emit) async {
      emit(AuthRegisterLoading());
      try {
        debugPrint('REGISTER: ${event.account.toRegistrationJson()}');
        var res = await authServices.register(event.account);
        emit(AuthRegisterSuccess(res));
      } catch (e) {
        if (e is DioException) {
          debugPrint('REGISTER ERROR DIO : ${e.response?.data.toString()}');
          emit(AuthRegisterError(
              e.response?.data.toString() ?? 'unknown error'));
        } else {
          emit(AuthRegisterError(e.toString()));
        }
      }
    });
  }
}
