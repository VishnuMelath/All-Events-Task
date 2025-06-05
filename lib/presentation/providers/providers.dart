import 'package:all_events_task/presentation/providers/auth/auth_provider.dart';
import 'package:all_events_task/presentation/providers/main_section/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCategoryProider = Provider<AuthProvider>(
  (ref) => AuthProvider(ref),
);

final eventProvider = Provider<EventProvider>((ref) => EventProvider(ref));
