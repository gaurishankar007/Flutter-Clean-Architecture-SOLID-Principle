import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/ui_helpers.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../app/presentation/base_widgets/form/text_field_widget.dart';
import '../../../cubits/login/login_cubit.dart';
import 'login_optional_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginFormWidget({
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
            TextFieldWidget(
              title: "Username",
              controller: usernameController,
              hintText: "Enter your username",
              validator: Validators.username,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Container(
              margin: UIHelpers.mediumTxxSmallBPadding,
              child: TextFieldWidget(
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
            LoginOptionalWidget(saveUserCredential: state.saveUserCredential),
          ],
        );
      },
    );
  }
}
