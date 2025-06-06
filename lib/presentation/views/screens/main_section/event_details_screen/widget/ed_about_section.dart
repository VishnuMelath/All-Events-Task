import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:flutter/material.dart';

class EdAboutSection extends StatelessWidget {
  final EventModel event;
  const EdAboutSection({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          'About',
          style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            ...event.tags.map(
              (e) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.primaryColor, width: 0.3),
                ),
                child: Text(e),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(event.eventNameRaw, style: const TextStyle(color: AppColors.grey)),
        const Text('3rd addition', style: TextStyle(color: AppColors.grey)),
        Text(
          'Marathon date ${event.startTimeDisplay}',
          style: const TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 10),

        const Text(
          '2km for under- 10\n5km for under 14\n10km for all - 10 to opern',
          style: TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          '1at 2nd 3rd\nGet - medal -prize money - gift hamper - certificate',
          style: TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          '- also every one get medal - certificate - Tshirt In all categories',
          style: TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          'Registration fees 400 rupees',
          style: TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          'Including - \nT shirt/water/banana/glucose/marathon\nphotography',
          style: TextStyle(color: AppColors.grey),
        ),
        const Divider(thickness: 0.15, height: 30),
      ],
    );
  }
}
