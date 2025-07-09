import 'package:flutter/material.dart';
import 'app.dart';
// import 'core/amplify_config.dart'; // You'll create this next

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await configureAmplify(); // Sets up Amplify plugins

  runApp(const App());
}
