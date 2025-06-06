import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/event_details_screen.dart';
import 'package:all_events_task/presentation/views/screens/main_section/home_screen/home_screen.dart';
import 'package:all_events_task/presentation/views/screens/main_section/purchase_ticket_screen/purchase_ticket_screen.dart';
import 'package:all_events_task/presentation/views/screens/main_section/search_screen/search_screen.dart';
import 'package:all_events_task/presentation/views/screens/onboarding_section/login_screen/login_screen.dart';
import 'package:all_events_task/presentation/views/screens/onboarding_section/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouteConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
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
              GoRoute(
                path: '/eventDetails',
                name: AppRouteNames.eventDetailsScreen,
                builder: (context, state) {
                  var event = state.extra as EventModel;
                  return EventDetailsScreen(event: event);
                },
              ),
              GoRoute(
                path: '/purchaseTicketScreen',
                name: AppRouteNames.purchaseTicketScreen,
                builder: (context, state) {
                  var url = state.extra as String;
                  return PurchaseTicketScreen(url: url);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
