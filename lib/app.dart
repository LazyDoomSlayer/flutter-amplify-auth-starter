import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/features/auth/reset_password/new_password_setted/new_password_setted_page.dart';
import 'package:flutter_amplify_auth_starter/features/auth/reset_password/set_new_password/set_new_password_page.dart';
import 'package:flutter_amplify_auth_starter/middlewares/auth_gate.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/constants.dart';
import 'features/auth/login/login_page.dart';
import 'features/auth/reset_password/reset_password_page.dart';
import 'features/home/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  void initState() {
    super.initState();
    initialisation();
  }

  void initialisation() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

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
