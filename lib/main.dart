// main.dart
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/core/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'amplify_config.dart';
import 'app.dart';

Future<bool> isUserSignedIn() async {
  final res = await Amplify.Auth.fetchAuthSession();
  return res.isSignedIn;
}

void main() async {
  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['ESRI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('ESRI_API_KEY is not defined in .env file.');
  } else {
    ArcGISEnvironment.apiKey = apiKey;
  }

  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  bool signedIn = await isUserSignedIn();

  runApp(App(initialRoute: signedIn ? AppRoutes.home : AppRoutes.login));
}
