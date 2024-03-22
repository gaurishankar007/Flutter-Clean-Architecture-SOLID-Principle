import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/int_extension.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../injector/injector.dart';
import '../arguments/sign_up_argument.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/error_text.dart';
import '../widgets/signUp/sign_up_button.dart';
import '../widgets/signUp/sign_up_form_container.dart';

@RoutePage(name: SIGN_UP_ROUTE)
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpArgument = SignUpArgument();

  @override
  void dispose() {
    authCubit.removeSignUpError();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.propHeight, bottom: 20.propHeight),
              child: Text("Welcome to chat app", style: x3LargeSemibold()),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => previous.signUpError != current.signUpError,
              builder: (context, state) => ErrorText(error: state.signUpError),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screen.dynamicHorizontalPadding),
                children: [
                  SignUpFormContainer(argument: signUpArgument),
                  SizedBox(height: 50.propHeight),
                  SignUpButton(argument: signUpArgument),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
