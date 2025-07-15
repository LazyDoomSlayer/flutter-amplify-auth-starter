import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/features/auth/login/login_page.dart';
import 'package:flutter_amplify_auth_starter/features/home/app_layout.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthSession>(
      future: Amplify.Auth.fetchAuthSession(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snap.hasError || !(snap.data?.isSignedIn ?? false)) {
          return const LoginPage();
        }

        return const AppLayout();
      },
    );
  }
}
