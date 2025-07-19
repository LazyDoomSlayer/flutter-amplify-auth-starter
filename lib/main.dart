import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'amplify_config.dart';
import 'app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['ESRI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('ESRI_API_KEY is not defined in .env file.');
  } else {
    ArcGISEnvironment.apiKey = apiKey;
  }

  await configureAmplify();

  runApp(const App());
}
