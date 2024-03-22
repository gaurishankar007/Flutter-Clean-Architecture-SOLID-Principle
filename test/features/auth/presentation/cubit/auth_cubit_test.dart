import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/core/errors/error_data.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/core/services/user_service.dart';
import 'package:boilerplate/features/auth/domain/entities/user_data.dart';
import 'package:boilerplate/features/auth/domain/forms/sign_in_form.dart';
import 'package:boilerplate/features/auth/domain/repositories/auth_repo.dart';
import 'package:boilerplate/features/auth/domain/useCases/save_user_data_uc.dart';
import 'package:boilerplate/features/auth/domain/useCases/sign_in_uc.dart';
import 'package:boilerplate/features/auth/domain/useCases/sign_up_uc.dart';
import 'package:boilerplate/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:boilerplate/features/auth/presentation/dependencies/auth_cubit_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

class UserServiceMock extends Mock implements UserService {}

void main() {
  late final AuthRepositoryMock authRepositoryMock;
  late final UserService userServiceMock;
  late final AuthCubitDependency dependency;
  late final AuthState authState;

  setUpAll(() {
    authRepositoryMock = AuthRepositoryMock();
    userServiceMock = UserServiceMock();

    dependency = AuthCubitDependency(
      signInUseCase: SignInUseCase(authRepository: authRepositoryMock),
      signUpUseCase: SignUpUseCase(authRepository: authRepositoryMock),
      saveUserDataUseCase: SaveUserDataUseCase(authRepository: authRepositoryMock),
      userService: userServiceMock,
    );
    authState = const AuthState(signInError: "", signUpError: "");
  });

  group("Auth Cubit", () {
    SignInForm signInForm = const SignInForm(email: "", password: "");
    UserData userData = const UserData.empty();
    blocTest(
      'Should emit auth state without any errors',
      build: () => AuthCubit(dependency: dependency),
      setUp: () => when(() => authRepositoryMock.signIn(signInForm))
          .thenAnswer((_) async => DataSuccess(data: userData)),
      act: (cubit) async => await cubit.sigIn(email: "", password: ""),
      expect: () => <AuthState>[authState],
      verify: (_) => verify(() => authRepositoryMock.signIn(signInForm)).called(1),
    );

    blocTest(
      'Should emit auth state with sign in error at last',
      build: () => AuthCubit(dependency: dependency),
      setUp: () => when(() => authRepositoryMock.signIn(signInForm))
          .thenAnswer((_) async => const DataFailure(error: ErrorData(message: "Invalid email"))),
      act: (cubit) async => await cubit.sigIn(email: "", password: ""),
      expect: () => <AuthState>[authState, authState.copyWith(signInError: "Invalid email")],
    );
  });
}
