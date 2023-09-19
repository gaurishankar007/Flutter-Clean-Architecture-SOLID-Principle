part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final PageController pageController;
  final bool pVisibility;
  final bool rememberMe;
  final bool loading;

  const AuthState({
    required this.pageController,
    required this.pVisibility,
    required this.rememberMe,
    required this.loading,
  });

  @override
  List<Object> get props => [
        pageController,
        pVisibility,
        rememberMe,
        loading,
      ];
}
