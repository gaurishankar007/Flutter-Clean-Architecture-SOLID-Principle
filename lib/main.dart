import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/config/theme/theme.dart';
import 'package:boilerplate/features/auth/presentation/cubit/auth_cubit.dart';
import 'injection/injector.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appData.init();
  runApp(Boilerplate());
}

class Boilerplate extends StatelessWidget {
  const Boilerplate({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, layout) {
      return OrientationBuilder(builder: (context, orientation) {
        size.init(layout, orientation);

        return BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Boilerplate App',
            theme: lightTheme,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
          ),
        );
      });
    });
  }
}
