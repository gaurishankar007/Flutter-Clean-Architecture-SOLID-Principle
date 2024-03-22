import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'injector/injector.dart';

Future<void> main() async {
  await initializer.initializeApp();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        screen.initializeScreen(constraints, context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => authCubit),
          ],
          child: MaterialApp.router(
            title: 'Chat App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
