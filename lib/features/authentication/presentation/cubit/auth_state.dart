part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSignInLoading extends AuthState {}

final class AuthSignInError extends AuthState {
  final String message;

  AuthSignInError(this.message);
}

final class AuthSignInSuccess extends AuthState {
  final String message;

  AuthSignInSuccess(this.message);
}

final class AuthSignUpLoading extends AuthState {}

final class AuthSignUpError extends AuthState {
  final String message;

  AuthSignUpError(this.message);
}

final class AuthSignUpSuccess extends AuthState {
  final String message;

  AuthSignUpSuccess(this.message);
}

final class AuthSignUpPickImage extends AuthState {}
