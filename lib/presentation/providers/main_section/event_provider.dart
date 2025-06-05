// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:all_events_task/data/remote/api_services.dart';
import 'package:all_events_task/domain/models/category_model.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/utils/api_end_points.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventProvider extends ChangeNotifier {
  final Ref _ref;
  EventProvider(this._ref);
  List<CategoryModel>? categories = [];
  List<EventModel>? events = [];
  bool isEventsLoading = true;
  bool isCategoriesLoading = true;

  Future getCategories() async {
    try {
      isCategoriesLoading = true;
      notifyListeners();
      var responce = await APIServices.getAPIWithoutToken(
        ApiEndPoints.getCategories,
      );
      if (responce.statusCode == 200) {
        var categoryList = jsonDecode(responce.body) as List;
        for (var element in categoryList) {
          categories ??= [];
          categories!.add(CategoryModel.fromJson(element));
        }
      }
    } on TimeoutException catch (_) {
      // handle timeout exception
    } on SocketException {
      //handle network error
    } catch (e) {
      //show error
    } finally {
      isCategoriesLoading = false;
      notifyListeners();
    }
  }

  Future getEvents(String? url) async {
    try {
      isEventsLoading = true;
      notifyListeners();
      var responce = await APIServices.getAPIWithoutToken(
        url ?? ApiEndPoints.getAllEvents,
      );
      if (responce.statusCode == 200) {
        var eventsData = jsonDecode(responce.body)['item'] as List;
        for (var element in eventsData) {
          events ??= [];
          events!.add(EventModel.fromJson(element));
        }
      } else {
        //show error
        events = null;
      }
    } on TimeoutException catch (_) {
      events = null;
      // handle timeout exception
    } on SocketException {
      events = null;

      //handle network error
    } catch (e) {
      events = null;

      //show error
    } finally {
      isEventsLoading = false;
      notifyListeners();
    }
  }
}
