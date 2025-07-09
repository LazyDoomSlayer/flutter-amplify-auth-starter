import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../amplifyconfiguration.dart';

bool _amplifyConfigured = false;

Future<void> configureAmplify() async {
  if (_amplifyConfigured) return;

  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);
    await Amplify.configure(amplifyconfig);

    _amplifyConfigured = true;
    safePrint('Amplify configured successfully');
  } on AmplifyAlreadyConfiguredException {
    safePrint('Amplify was already configured.');
  } catch (e) {
    safePrint('Failed to configure Amplify: $e');
  }
}
