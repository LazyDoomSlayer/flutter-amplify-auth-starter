import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';
import 'package:flutter_amplify_auth_starter/widgets/app_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final username = _emailController.text.trim();
    final password = _passwordController.text;

    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      if (res.isSignedIn) {
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      } else {
        // Handle next steps
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Additional confirmation required.')),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: DarkColors.systemError,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Unexpected error, please try again.'),
          backgroundColor: DarkColors.systemError,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            const Text(
              'SIGN IN',
              style: TextStyle(
                color: DarkColors.heading1Text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Email label
            const Text(
              'Email',
              style: TextStyle(
                color: DarkColors.paragraph2Text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            AppTextField(
              label: 'Email Address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Password label with toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(
                    color: DarkColors.paragraph2Text,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: _togglePasswordVisibility,
                  child: Row(
                    children: [
                      Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: DarkColors.paragraph2Text,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _obscurePassword ? 'SHOW' : 'HIDE',
                        style: const TextStyle(
                          color: DarkColors.paragraph2Text,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            AppTextField(
              label: 'Password',
              controller: _passwordController,
              obscureText: _obscurePassword,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter your password'
                  : null,
              keyboardType: TextInputType.visiblePassword,
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DarkColors.backgroundBtnPrimary,
                  foregroundColor: DarkColors.blackText,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  elevation: 0,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          DarkColors.blackText,
                        ),
                      )
                    : const Text('SIGN IN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
