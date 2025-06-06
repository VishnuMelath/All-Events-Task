import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/views/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EdOrganisationSection extends StatelessWidget {
  final EventModel event;
  const EdOrganisationSection({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organized By',
          style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
        ),
        Center(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(width: 0.15),
                ),
                child: const Icon(
                  Icons.hail,
                  color: Color.fromARGB(255, 100, 21, 21),
                  size: 40,
                ),
              ),
              Text(
                'Guru athletics Academy',
                style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 3),
              const Row(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('371 Follower', style: TextStyle(color: AppColors.grey)),
                  Icon(Icons.star_rounded, color: Colors.amber, size: 15),
                  Text('3.67', style: TextStyle(color: AppColors.grey)),
                ],
              ),
              const SizedBox(height: 3),
              const Text(
                '1 Upcoming Event',
                style: TextStyle(color: AppColors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Row(
                  spacing: 15,
                  children: [
                    Expanded(
                      child: CustomButton(
                        borderRadius: 0,
                        vPadding: 8,
                        label: 'Follow',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        buttonColor: ButtonColor.white,
                        borderRadius: 0,
                        vPadding: 8,
                        label: 'Message',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(thickness: 0.15, height: 30),
      ],
    );
  }
}
