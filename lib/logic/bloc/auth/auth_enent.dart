// auth/bloc/auth_event.dart
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent(this.email, this.password);
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterEvent(this.email, this.password);
}

class AuthLogoutEvent extends AuthEvent {}
