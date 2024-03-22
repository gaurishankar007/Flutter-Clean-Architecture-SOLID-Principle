import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/domain/entities/user_data.dart';
import 'package:boilerplate/features/auth/domain/forms/sign_in_form.dart';
import 'package:boilerplate/features/auth/domain/repositories/auth_repo.dart';
import 'package:boilerplate/features/auth/domain/useCases/sign_in_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  late final SignInForm form;
  late final AuthRepositoryMock authRepositoryMock;
  late final SignInUseCase signInUseCase;
  late final UserData userData;

  setUp(() {
    form = const SignInForm(email: "user", password: "pwd");
    authRepositoryMock = AuthRepositoryMock();
    signInUseCase = SignInUseCase(authRepository: authRepositoryMock);
    userData = const UserData.empty();

    /// Register a fallback value for `SignInForm`
    /// To use `any` or `captureAny` on a parameter of type `SignInForm`
    registerFallbackValue(const SignInForm(email: "", password: ""));
  });

  test("Should get user model after signing in", () async {
    /// Arranging
    when(() => authRepositoryMock.signIn(any()))
        .thenAnswer((_) async => DataSuccess(data: userData));
    // Verify no interactions have occurred.
    verifyNever(() => authRepositoryMock.signIn(form));

    /// Act (interacting)
    final result = await signInUseCase.call(form);

    /// Assert
    verify(() => authRepositoryMock.signIn(form)).called(1);
    expect(result, DataSuccess(data: userData));
    // When mocktail verifies an invocation, it is then excluded from further verifications.
    verifyNever(() => authRepositoryMock.signIn(form));
  });
}
