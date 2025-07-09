import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Copyright',
                style: TextStyle(
                  color: DarkColors.paragraph3Text,
                  fontSize: 12,
                ),
              ),
              Text(
                '© 2025 LazyDoomSlayer',
                style: TextStyle(
                  color: DarkColors.paragraph1Text,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Container(
            height: 36,
            width: 1,
            color: DarkColors.elementDivider,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Powered by',
                style: TextStyle(
                  color: DarkColors.paragraph3Text,
                  fontSize: 12,
                ),
              ),
              Text(
                'LazyDoomSlayer',
                style: TextStyle(
                  color: DarkColors.paragraph1Text,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
