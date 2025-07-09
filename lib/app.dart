import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/middlewares/auth_gate.dart';

import 'core/constants.dart';
import 'features/auth/login/login_page.dart';
import 'features/auth/reset_password/reset_password_page.dart';
import 'features/home/home_page.dart';

class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Amplify Auth',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const AuthGate(),
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.resetPassword: (context) => const ResetPasswordPage(),
        AppRoutes.home: (context) => const HomePage(),
      },
    );
  }
}
