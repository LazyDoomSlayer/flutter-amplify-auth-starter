import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.backgroundBody,
      appBar: AppBar(backgroundColor: DarkColors.backgroundBody, elevation: 0),
      body: const Center(
        child: Text(
          'Welcome MAP!',
          style: TextStyle(color: DarkColors.heading1Text),
        ),
      ),
    );
  }
}
