import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/extensions/int_extension.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../injector/injector.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/error_text.dart';
import '../widgets/signIn/sign_in_actions.dart';
import '../widgets/signIn/sign_in_form_container.dart';

@RoutePage(name: SIGN_IN_ROUTE)
class SignIn extends StatelessWidget {
  SignIn({super.key});

  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.propHeight, bottom: 20.propHeight),
              child: Text("Sign in with your email", style: x3LargeSemibold()),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => previous.signInError != current.signInError,
              builder: (context, state) => ErrorText(error: state.signInError),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: screen.dynamicHorizontalPadding),
              children: [
                SignInFormContainer(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                SizedBox(height: 50.propHeight),
                SignInAction(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
