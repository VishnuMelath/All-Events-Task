import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:flutter/material.dart';

class EdLocationSection extends StatelessWidget {
  final EventModel event;
  const EdLocationSection({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 0.15, height: 30),
        Text(
          'Location',
          style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.grey,
              size: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                // spacing: 10,
                children: [
                  Text(
                    event.venue.fullAddress,
                    style: const TextStyle(color: AppColors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('View on Map'),
                        Icon(Icons.keyboard_arrow_down_outlined, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(thickness: 0.15, height: 30),
      ],
    );
  }
}
