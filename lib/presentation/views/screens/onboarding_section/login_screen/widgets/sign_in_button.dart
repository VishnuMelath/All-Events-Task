import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatefulWidget {
  final String image;
  final String text;
  final void Function()? onTap;
  const SignInButton({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      curve: Easing.legacyDecelerate,
      duration: const Duration(milliseconds: 100),
      scale: scale,
      child: GestureDetector(
        onTap: () {
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(105),
          ),
          child: Row(
            spacing: 20,
            children: [
              Image(width: 30, image: AssetImage(widget.image)),

              Expanded(
                child: Center(
                  child: Text(
                    widget.text,
                    style: AppTextStyles.lufgaSemiBold.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
