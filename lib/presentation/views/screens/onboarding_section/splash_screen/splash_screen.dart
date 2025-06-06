// ignore_for_file: use_build_context_synchronously

import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/data/data_sources/user_sources.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      precacheImage(const AssetImage('assets/images/login_bg.jpg'), context);
    });
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 300),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    Future.delayed(const Duration(seconds: 1, milliseconds: 800), () {
      UserSources.getData().then((value) {
        if (UserSources.isLoggedIn) {
          ref.read(eventProvider).getCategories();
          context.goNamed(AppRouteNames.homeScreen);
        } else {
          context.goNamed(AppRouteNames.loginScreen);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      Positioned(
                        left: MediaQuery.sizeOf(context).width / 2 - 40,
                        top:
                            animation.value *
                            ((MediaQuery.sizeOf(context).height / 2) - 90),
                        child: const Image(
                          width: 80,
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Expanded(
              child: Text('All Events', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
