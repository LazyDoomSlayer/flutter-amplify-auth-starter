import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class NewPasswordSettedPage extends StatelessWidget {
  const NewPasswordSettedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final success = args['success'] == true;

    final icon = success ? Icons.check_circle_outline : Icons.error_outline;
    final iconColor = success
        ? DarkColors.systemSuccess
        : DarkColors.systemError;
    final title = success ? 'PASSWORD CHANGED' : 'RESET FAILED';
    final message = success
        ? 'Your password has been changed\nsuccessfully'
        : 'Something went wrong while\nchanging your password';

    return Scaffold(
      backgroundColor: DarkColors.backgroundBody,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 72, color: iconColor),
              const SizedBox(height: 16),

              Text(
                title,
                style: const TextStyle(
                  color: DarkColors.whiteText,
                  fontSize: 28,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                message,
                style: const TextStyle(
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
                    side: const BorderSide(color: DarkColors.brandPurple),
                    foregroundColor: DarkColors.whiteText,
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
