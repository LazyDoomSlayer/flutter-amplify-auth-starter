import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class NewPasswordSettedPage extends StatelessWidget {
  const NewPasswordSettedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.backgroundBody,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 72,
                color: DarkColors.systemSuccess,
              ),
              const SizedBox(height: 16),

              const Text(
                'PASSWORD CHANGED',
                style: TextStyle(
                  color: DarkColors.whiteText,
                  fontSize: 28,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Your password has been changed\nsuccessfully',
                style: TextStyle(
                  color: DarkColors.paragraph2Text,
                  fontSize: 14,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurpleAccent),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  child: const Text('BACK TO SIGN IN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
