import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/images/LazyDoomSlayer-text-logo.png'),
      ),
    );
  }
}
