import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/constants/ui_text.dart';
import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/core/utils/text_styles.dart';
import 'package:boilerplate/core/extensions/build_context_extension.dart';
import 'package:boilerplate/core/validators/validators.dart';
import 'package:boilerplate/core/widgets/button.dart';
import 'package:boilerplate/core/widgets/checkbox.dart';
import 'package:boilerplate/core/widgets/form/text_form.dart';
import 'package:boilerplate/core/widgets/form/text_form_validator.dart';
import 'package:boilerplate/features/auth/domain/parameter/login_param.dart';
import 'package:boilerplate/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:boilerplate/injection/injector.dart';

@RoutePage(name: kLoginR)
class Login extends StatelessWidget {
  Login({super.key});

  final RxRequireValidator usernameC = RxRequireValidator(kUsername);
  final RxRequireValidator passwordC = RxRequireValidator(kPassword);

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    snackBar.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.sos,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.pSW(26),
              vertical: size.pSH(25),
            ),
            child: BlocBuilder<AuthCubit, AuthState?>(
              builder: (context, state) {
                if (state is AuthState) {
                  final pVisibility = state.pVisibility;
                  final rememberMe = state.rememberMe;

                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: size.pSH(20)),
                        child: RxTextFormValidator(
                          stream: usernameC.stream,
                          form: CusTextForm(
                            title: kUsername,
                            hintText: kUHint,
                            onChanged: (value) => usernameC.validate(
                              value ?? "",
                            ),
                            suffixIcon: SizedBox(),
                          ),
                        ),
                      ),
                      RxTextFormValidator(
                        stream: passwordC.stream,
                        form: CusTextForm(
                          title: kPassword,
                          hintText: kPHint,
                          onChanged: (value) => passwordC.validate(
                            value ?? "",
                          ),
                          obscureText: !pVisibility,
                          suffixIcon: Icon(
                            pVisibility
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: kBlack50,
                            size: size.pSW(20),
                          ),
                          suffixBoxCon: BoxConstraints(
                            minWidth: size.pSW(40),
                            maxWidth: size.pSW(40),
                          ),
                          suffixOnTap: () => authCubit.passwordV(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: size.pSH(16),
                          bottom: size.pSH(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CusCheckBox(
                              value: rememberMe,
                              title: kRemember,
                              titleStyle: smRegular(kBlack),
                              onChanged: (value) => authCubit.remember(),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                kForgotP,
                                style: mdRegular(kBlack),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<Object>(
                        stream: Rx.combineLatest2(
                          usernameC.stream,
                          passwordC.stream,
                          (a, b) => true,
                        ),
                        builder: (context, snapshot) {
                          return CusButton(
                            loading: true,
                            onTap: () async {
                              usernameC.checkValidation();
                              passwordC.checkValidation();
                              if (snapshot.hasData == false) return;

                              LoginParameter param = LoginParameter(
                                username: usernameC.stream.value,
                                password: passwordC.stream.value,
                              );

                              await authCubit.login(param);
                            },
                            text: kLogin.toUpperCase(),
                          );
                        },
                      ),
                    ],
                  );
                }

                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
