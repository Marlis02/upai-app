// auth/bloc/auth_state.dart
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Map<String, dynamic> token;
  AuthSuccess(this.token);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
