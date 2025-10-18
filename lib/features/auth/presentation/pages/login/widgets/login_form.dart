import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../shared_ui/utils/ui_helpers.dart';
import '../../../../../../shared_ui/utils/validators.dart';
import '../../../../../../shared_ui/ui/base/form/base_text_field.dart';
import '../../../cubits/login/login_cubit.dart';
import 'login_optional.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseTextField(
              title: "Username",
              controller: usernameController,
              hintText: "Enter your username",
              validator: Validators.username,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Container(
              margin: UIHelpers.mediumTxxSmallBPadding,
              child: BaseTextField(
                title: "Password",
                hintText: "Enter your password",
                controller: passwordController,
                validator: Validators.password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: !state.passwordVisibility,
                suffixIcon: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: context.read<LoginCubit>().togglePasswordVisibility,
                  child: Icon(
                    state.passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.black60,
                    size: 22,
                  ),
                ),
              ),
            ),
            LoginOptional(saveUserCredential: state.saveUserCredential),
          ],
        );
      },
    );
  }
}
