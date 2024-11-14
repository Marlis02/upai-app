import 'package:ctmax_upai/models/account.dart';

abstract class AuthRegisterState {}

class AuthRegisterInitial extends AuthRegisterState {}

class AuthRegisterLoading extends AuthRegisterState {}

class AuthRegisterError extends AuthRegisterState {
  final String message;
  AuthRegisterError(this.message);
}

class AuthRegisterSuccess extends AuthRegisterState {
  final Map<String, dynamic> account;
  AuthRegisterSuccess(this.account);
}
