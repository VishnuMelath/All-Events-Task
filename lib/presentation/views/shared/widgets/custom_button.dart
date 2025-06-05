import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final Widget? icon;
  final void Function()? onTap;
  final ButtonColor? buttonColor;
  final double? width;
  final double? vPadding;
  final double? hPadding;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool isDisabled;
  const CustomButton({
    super.key,
    required this.label,
    this.icon,
    this.borderRadius,
    required this.onTap,
    this.width,
    this.buttonColor = ButtonColor.blue,
    this.textStyle,
    this.vPadding,
    this.hPadding,
    this.isDisabled = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      curve: Easing.legacyDecelerate,
      duration: const Duration(milliseconds: 100),
      scale: scale,
      child: Material(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.isDisabled
              ? null
              : () {
                  setState(() {
                    scale = 0.95;
                  });
                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      scale = 1;
                    });
                  });

                  Future.delayed(const Duration(milliseconds: 150), () {
                    if (widget.onTap != null) {
                      widget.onTap!();
                    }
                  });
                },
          child: Container(
            width: widget.width,
            padding: EdgeInsets.symmetric(
              vertical: widget.vPadding ?? 14,
              horizontal: widget.hPadding ?? 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
              color: widget.isDisabled
                  ? Colors.grey[300]
                  : widget.buttonColor == ButtonColor.blue
                  ? AppColors.primaryColor
                  : AppColors.white,
              border: Border.all(
                width: 0.6,
                color: widget.isDisabled
                    ? Colors.grey[300]!
                    : AppColors.primaryColor,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label,
                    style:
                        widget.textStyle ??
                        TextStyle(
                          fontSize: 13,
                          color: widget.buttonColor != ButtonColor.blue
                              ? AppColors.primaryColor
                              : AppColors.backgroundColor,
                        ),
                  ),
                  widget.icon ?? const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonColor { white, blue }
