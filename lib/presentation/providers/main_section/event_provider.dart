import 'package:all_events_task/domain/models/category_model.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventProvider extends ChangeNotifier {
  final Ref _ref;
  EventProvider(this._ref);
  List<CategoryModel>? categories = [];
  List<EventModel>? events = [];
  bool isEventsLoading = true;
  bool isCategoriesLoading = true;

  Future getEvents(String? url) async {}
}
