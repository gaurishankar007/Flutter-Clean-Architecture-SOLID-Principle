import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/extensions/int_extension.dart';
import '../../../../../core/navigation/navigator.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../../widgets/buttons/custom_text_button.dart';

class SignInAction extends StatelessWidget {
  final BehaviorSubject<String> emailController;
  final BehaviorSubject<String> passwordController;

  const SignInAction({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder(
          stream: Rx.combineLatest2(
            emailController,
            passwordController,
            (a, b) => true,
          ),
          builder: (context, snapshot) {
            String? email = emailController.stream.valueOrNull;
            String? password = passwordController.stream.valueOrNull;
            bool disabled = (email ?? "").isEmpty || (password ?? "").isEmpty;

            return CustomElevatedButton(
              onTap: () {
                // authCubit.sigIn(email: email!, password: password!);
                replaceToDashboard();
              },
              text: "Sign In",
              expandWidth: true,
              disabled: disabled,
            );
          },
        ),
        const SizedBox(height: 10),
        CustomElevatedButton(
          onTap: () => pushName(SIGN_UP_PATH),
          expandWidth: true,
          text: "Create new account",
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 45.propHeight),
          child: CustomTextButton(
            onPressed: () {},
            text: "Forget Password?",
            textStyle: smallMedium(),
          ),
        ),
      ],
    );
  }
}
