import 'package:ctmax_upai/models/account.dart';

abstract class AuthRegisterEvent {}

class AuthRegisterRequest extends AuthRegisterEvent {
  Account account;
  AuthRegisterRequest(this.account);
}
