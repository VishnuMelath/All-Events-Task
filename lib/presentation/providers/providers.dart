import 'package:all_events_task/presentation/providers/auth/auth_provider.dart';
import 'package:all_events_task/presentation/providers/main_section/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref);
});

final eventProvider = ChangeNotifierProvider<EventProvider>(
  (ref) => EventProvider(ref),
);

final isGridProvider = StateProvider((ref) => true);
