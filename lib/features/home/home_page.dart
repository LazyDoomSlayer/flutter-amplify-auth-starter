import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSigningOut = false;

  Future<void> _signOut() async {
    if (_isSigningOut) return;

    setState(() => _isSigningOut = true);
    try {
      final result = await Amplify.Auth.signOut();
      if (result is CognitoCompleteSignOut) {
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Error signing out')));
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _isSigningOut = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.backgroundBody,
      appBar: AppBar(
        backgroundColor: DarkColors.backgroundBody,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _isSigningOut
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(
                        DarkColors.heading1Text,
                      ),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.logout),
                    color: DarkColors.heading1Text,
                    tooltip: 'Sign Out',
                    onPressed: _signOut,
                  ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome Home!',
          style: TextStyle(color: DarkColors.heading1Text),
        ),
      ),
    );
  }
}
