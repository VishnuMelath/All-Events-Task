import 'package:all_events_task/config/themes/colors.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error }

showSuccessSnackBars(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    CustomSnackbars(
      context,
      message: message,
      snackBarType: SnackBarType.success,
    ),
  );
}

showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    CustomSnackbars(
      context,
      message: message,
      snackBarType: SnackBarType.error,
    ),
  );
}

class CustomSnackbars extends SnackBar {
  final BuildContext context;
  final String message;
  final SnackBarType snackBarType;

  const CustomSnackbars(
    this.context, {
    super.key,
    super.content = const SizedBox(),
    super.padding,
    super.margin,
    super.action,
    super.duration,
    required this.message,
    required this.snackBarType,
  });
  @override
  double? get elevation => 0;
  @override
  Color? get backgroundColor => Colors.transparent;
  @override
  Duration get duration => const Duration(milliseconds: 500);
  @override
  Widget get content => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: snackBarType == SnackBarType.success
              ? AppColors.primaryColor.withValues(alpha: 0.5)
              : Colors.red.withValues(alpha: 0.5),
          blurRadius: 10,
          spreadRadius: 2,

          offset: const Offset(0, 10),
        ),
      ],
    ),
    padding: const EdgeInsets.all(16),
    child: Row(
      spacing: 15,
      children: [
        if (snackBarType == SnackBarType.error)
          Icon(
            snackBarType == SnackBarType.success ? Icons.done : Icons.warning,
            color: snackBarType == SnackBarType.success
                ? AppColors.primaryColor
                : Colors.red.withValues(alpha: 0.2),
          ),
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              color: snackBarType == SnackBarType.success
                  ? AppColors.primaryColor
                  : Colors.red,
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
          child: Icon(
            Icons.close,
            color: snackBarType == SnackBarType.success
                ? AppColors.primaryColor
                : Colors.red,
          ),
        ),
      ],
    ),
  );
}
