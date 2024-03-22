import 'package:equatable/equatable.dart';

/// Without equality the auth cubit test will fail
class SignInForm extends Equatable {
  final String email;
  final String password;

  const SignInForm({required this.email, required this.password});
  Map<String, String> get toJson => {
        "email": email,
        "password": password,
      };

  @override
  List<Object?> get props => [email, password];
}
