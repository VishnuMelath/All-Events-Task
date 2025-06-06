import 'package:all_events_task/config/themes/colors.dart';
import 'package:flutter/material.dart';

class HighlightsTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  const HighlightsTile({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        spacing: 10,
        children: [
          Icon(iconData, color: AppColors.primaryColor, size: 20),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
