import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/components/app_navigation_bar.dart';
import 'package:flutter_amplify_auth_starter/features/home/home_page.dart';
import 'package:flutter_amplify_auth_starter/features/home/map_page.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [HomePage(), MapPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
