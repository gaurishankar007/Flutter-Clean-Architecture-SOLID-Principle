part of 'auth_cubit.dart';

class AuthState {
  final String signInError;
  final String signUpError;

  const AuthState({
    required this.signInError,
    required this.signUpError,
  });

  factory AuthState.initial() => const AuthState(
        signInError: "",
        signUpError: "",
      );

  AuthState copyWith({
    String? signInError,
    String? signUpError,
    String? updateProfileError,
  }) =>
      AuthState(
        signInError: signInError ?? this.signInError,
        signUpError: signUpError ?? this.signUpError,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      other.signInError == signInError && other.signUpError == signUpError;

  @override
  int get hashCode => Object.hash(
        signInError,
        signUpError,
      );
}
