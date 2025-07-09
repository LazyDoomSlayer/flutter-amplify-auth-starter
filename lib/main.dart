// main.dart
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';

import 'amplify_config.dart';
import 'app.dart';

Future<bool> isUserSignedIn() async {
  final res = await Amplify.Auth.fetchAuthSession();
  return res.isSignedIn;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify(); // your Amplify setup
  bool signedIn = await isUserSignedIn();

  runApp(App(initialRoute: signedIn ? AppRoutes.home : AppRoutes.login));
}
