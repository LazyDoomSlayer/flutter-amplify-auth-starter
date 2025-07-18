import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';
import 'package:flutter_amplify_auth_starter/widgets/app_text_field.dart';

class SetNewPasswordForm extends StatefulWidget {
  const SetNewPasswordForm({super.key});

  @override
  State<SetNewPasswordForm> createState() => _SetNewPasswordFormState();
}

class _SetNewPasswordFormState extends State<SetNewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late final String? email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final emailArg = args?['email'] ?? '';

    _emailController = TextEditingController(text: emailArg);
  }

  late final TextEditingController _emailController;
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscurePasswordRepeat = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _togglePasswordRepeatVisibility() {
    setState(() {
      _obscurePasswordRepeat = !_obscurePasswordRepeat;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  Future<void> confirmResetPassword({
    required String email,
    required String newPassword,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: newPassword,
        confirmationCode: confirmationCode,
      );
      Navigator.pushNamed(
        context,
        AppRoutes.newPasswordSetted,
        arguments: {'success': true},
      );

      safePrint('Password reset complete: ${result.isPasswordReset}');
    } catch (e) {
      Navigator.pushNamed(
        context,
        AppRoutes.newPasswordSetted,
        arguments: {'success': false},
      );
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final email = _emailController.text.trim();
    final newPassword = _passwordController.text.trim();
    final confirmationCode = _codeController.text.trim();

    await confirmResetPassword(
      email: email,
      newPassword: newPassword,
      confirmationCode: confirmationCode,
    );

    setState(() => _isLoading = false);
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
              'Set New Password',
              style: TextStyle(
                color: DarkColors.heading1Text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Code label
            const Text(
              'Verification Code',
              style: TextStyle(
                color: DarkColors.paragraph2Text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            AppTextField(
              label: 'Verification Code',
              controller: _codeController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),

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
              readOnly: true,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),

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

            const SizedBox(height: 16),
            // Password label with toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Repeat Password',
                  style: TextStyle(
                    color: DarkColors.paragraph2Text,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: _togglePasswordRepeatVisibility,
                  child: Row(
                    children: [
                      Icon(
                        _obscurePasswordRepeat
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: DarkColors.paragraph2Text,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _obscurePasswordRepeat ? 'SHOW' : 'HIDE',
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
              label: 'Repeat Password',
              controller: _passwordRepeatController,
              obscureText: _obscurePasswordRepeat,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please repeat your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
            ),

            const SizedBox(height: 8),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DarkColors.backgroundBtnPrimary,
                  disabledBackgroundColor: DarkColors.backgroundBtnPrimary,
                  foregroundColor: DarkColors.blackText,
                  disabledForegroundColor: DarkColors.blackText,

                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size.fromHeight(48),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  elevation: 0,
                ),
                child: _isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(
                            DarkColors.blackText,
                          ),
                        ),
                      )
                    : const Text('Change Password'),
              ),
            ),

            const SizedBox(height: 24),
            Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(AppRoutes.login),
                child: const Text.rich(
                  TextSpan(
                    text: 'Return to ',
                    style: TextStyle(
                      color: DarkColors.paragraph1Text,
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: DarkColors.paragraph1Text,
                          color: DarkColors.paragraph1Text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
