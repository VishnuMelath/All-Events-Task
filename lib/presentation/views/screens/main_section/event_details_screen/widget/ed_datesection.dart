import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:flutter/material.dart';

class EdDatesection extends StatelessWidget {
  final EventModel event;
  const EdDatesection({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date & Time',
          style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.timer_sharp, color: AppColors.grey, size: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // spacing: 10,
                children: [
                  Text(
                    '${event.startTimeDisplay} to ${event.endTimeDisplay}',
                    style: const TextStyle(color: AppColors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('+ Add to Calender'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
