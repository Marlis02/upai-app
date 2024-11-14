abstract class AuthLoginEvent {}

class AuthLoginRequest extends AuthLoginEvent {
  final String email;
  final String password;

  AuthLoginRequest(this.email, this.password);
}
