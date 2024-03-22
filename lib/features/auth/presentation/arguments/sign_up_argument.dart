import 'package:rxdart/rxdart.dart';

/// Stream controllers for sign up form
class SignUpArgument {
  final BehaviorSubject nameController;
  final BehaviorSubject emailController;
  final BehaviorSubject passwordController;
  final BehaviorSubject confirmPasswordController;

  SignUpArgument()
      : nameController = BehaviorSubject<String>(),
        emailController = BehaviorSubject<String>(),
        passwordController = BehaviorSubject<String>(),
        confirmPasswordController = BehaviorSubject<String>();
}
