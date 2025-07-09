import 'package:flutter/material.dart';

import 'amplify_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureAmplify();

  runApp(const App());
}
