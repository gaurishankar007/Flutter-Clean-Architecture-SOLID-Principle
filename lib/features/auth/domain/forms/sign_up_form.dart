class SignUpForm {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpForm({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, String> get toJson => {
        "name": name,
        "email": email,
        "password": password,
      };
}
