import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/resources/data_state.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/constants/ui_text.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/validators/validators.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/form/text_form.dart';
import '../../../../core/widgets/form/text_form_validator.dart';
import '../../../../injection/injector.dart';
import '../../data/models/logData/log_data_model.dart';

@RoutePage(name: kLoginR)
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RxRequireValidator usernameC = RxRequireValidator(kUsername);
  final RxRequireValidator passwordC = RxRequireValidator(kPassword);
  bool pVisibility = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    snackBar.init(context);
    if (appData.logDataModel.biometricEnabled) {
      usernameC.stream.sink.add(appData.logDataModel.username);
    }
  }

  getUsername() async {
    final dState = await getLogDataUC.call();
    if (dState is SuccessState) usernameC.stream.value = dState.data!.username;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.sos,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.pSW(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: size.pSH(30),
                    bottom: size.pSH(40),
                  ),
                  child: RxTextFormValidator(
                    stream: usernameC.stream,
                    form: CusTextForm(
                      title: kUsername,
                      initialValue: usernameC.stream.valueOrNull,
                      hintText: kUHint,
                      suffixIcon: SizedBox(),
                      onChanged: (value) => usernameC.validate(value ?? ""),
                    ),
                  ),
                ),
                StatefulBuilder(builder: (context, setState) {
                  return RxTextFormValidator(
                    stream: passwordC.stream,
                    form: CusTextForm(
                      title: kPassword,
                      hintText: kPHint,
                      obscureText: !pVisibility,
                      suffixIcon: Icon(
                        pVisibility ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: k1B1,
                        size: size.pSW(25),
                      ),
                      suffixBoxCon: BoxConstraints(
                        minWidth: size.pSW(50),
                        maxWidth: size.pSW(50),
                      ),
                      suffixOnTap: () => setState(() => pVisibility = !pVisibility),
                      onChanged: (value) => passwordC.validate(value ?? ""),
                    ),
                  );
                }),
                SizedBox(height: size.pSH(25)),
                StreamBuilder(
                  stream: Rx.combineLatest2(
                    usernameC.stream,
                    passwordC.stream,
                    (a, b) => true,
                  ),
                  builder: (context, snapshot) {
                    return CusButton(
                      expandWidth: true,
                      loading: true,
                      onTap: () async {
                        usernameC.checkValidation();
                        passwordC.checkValidation();
                        if (snapshot.hasData) {
                          LogDataModel param = LogDataModel(
                            username: usernameC.stream.value,
                            password: passwordC.stream.value,
                          );
                                    
                          await authCubit.login(param);
                        }
                      },
                      text: kLogin.toUpperCase(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
