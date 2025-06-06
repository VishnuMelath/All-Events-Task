import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/highlights_tile.dart';
import 'package:flutter/material.dart';

class HighlightSection extends StatelessWidget {
  final EventModel event;
  const HighlightSection({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          spacing: 10,
          children: [
            const Icon(Icons.nat),
            Text(
              'Organized by ${event.location}',
              style: const TextStyle(color: AppColors.grey, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'Highlights',
          style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
        ),
        HighlightsTile(
          iconData: Icons.auto_graph_rounded,
          text: event.location,
        ),
        HighlightsTile(
          iconData: Icons.calendar_month,
          text: event.startTimeDisplay,
        ),
        HighlightsTile(
          iconData: Icons.location_on_outlined,
          text: event.venue.fullAddress,
        ),
        const HighlightsTile(
          iconData: Icons.price_change,
          text: 'INR 400 to 500',
        ),
        const HighlightsTile(
          iconData: Icons.person,
          text: '89 people are interested',
        ),
        Row(
          children: [
            const Icon(Icons.abc, color: Colors.transparent),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.only(right: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.backgroundColor),
                    color: Colors.amber,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.only(right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.backgroundColor),
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.backgroundColor),
                    color: Colors.red,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.backgroundColor),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('View all')),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
