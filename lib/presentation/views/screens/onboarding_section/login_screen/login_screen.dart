import 'dart:ui';

import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/screens/onboarding_section/login_screen/widgets/sign_in_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,

            image: AssetImage('assets/images/login_bg.jpg'),
          ),
        ),
        child: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  'Sign In',
                  style: AppTextStyles.lufgaSemiBold.copyWith(
                    height: 0,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const Text(
                  'Discover events, meet new people and make memories',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    height: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(),
                const SignInButton(
                  image: 'assets/images/fb.png',
                  text: 'Continue with Facebook',
                ),
                SignInButton(
                  image: 'assets/images/google.png',
                  text: 'Sign in with Google',
                  onTap: () {
                    ref.read(authProvider).signupUsingGoogle(context);
                  },
                ),
                const SignInButton(
                  image: 'assets/images/mail.png',
                  text: 'Sign in with Email',
                ),
                const SizedBox(),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'By signing in, I agree to Allevent\'s ',
                    style: const TextStyle(
                      fontFamily: 'Lufga',
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'privacy policy',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'Terms of services.',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},

                  child: const Text(
                    'Continue without login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
