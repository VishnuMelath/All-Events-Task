import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/presentation/views/screens/main_section/home_screen/home_screen.dart';
import 'package:all_events_task/presentation/views/screens/main_section/search_screen/search_screen.dart';
import 'package:all_events_task/presentation/views/screens/onboarding_section/login_screen/login_screen.dart';
import 'package:all_events_task/presentation/views/screens/onboarding_section/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouteConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
        routes: [
          GoRoute(
            path: '/login',
            name: AppRouteNames.loginScreen,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/home',
            name: AppRouteNames.homeScreen,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: '/search',
                name: AppRouteNames.searchScreen,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
