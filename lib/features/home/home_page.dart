import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.backgroundBody,
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(
            color: DarkColors.heading1Text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
