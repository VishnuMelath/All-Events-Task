import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: ListView(
        children: [
          EdAppBar(eventModel: event),
          Text(
            event.eventName,
            style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
          ),
          Row(
            spacing: 10,
            children: [
              const Icon(Icons.nat),
              Text('Organized by ${event.ownerId}'),
            ],
          ),
        ],
      ),
    );
  }
}
