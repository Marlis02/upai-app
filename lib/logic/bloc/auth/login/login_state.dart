abstract class AuthLoginState {}

class AuthLoginInitial extends AuthLoginState {}

class AuthLoginLoading extends AuthLoginState {}

class AuthLoginSuccess extends AuthLoginState {
  final Map<String, dynamic> token;
  AuthLoginSuccess(this.token);
}

class AuthLoginError extends AuthLoginState {
  final String message;
  AuthLoginError(this.message);
}
