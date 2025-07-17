import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/features/auth/reset_password/new_password_setted/new_password_setted_page.dart';
import 'package:flutter_amplify_auth_starter/features/auth/reset_password/set_new_password/set_new_password_page.dart';
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
        AppRoutes.setNewPassword: (context) => const SetNewPasswordPage(),
        AppRoutes.newPasswordSetted: (context) => const NewPasswordSettedPage(),
      },
    );
  }
}
