import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    Future.delayed(Duration(seconds: 1, milliseconds: 100), () {
      //navigate
      ref.read(authProvider).signupUsingGoogle();
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
                      SizedBox(width: double.infinity, height: double.infinity),

                      Positioned(
                        left: MediaQuery.sizeOf(context).width / 2 - 40,
                        top:
                            animation.value *
                            ((MediaQuery.sizeOf(context).height / 2) - 80),
                        child: Image(
                          width: 80,
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Text('Duty Doctor', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
