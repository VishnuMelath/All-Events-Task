import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EdAppBar extends StatelessWidget {
  final EventModel eventModel;
  const EdAppBar({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: CachedNetworkImage(
            width: MediaQuery.sizeOf(context).width,
            height: 180,
            fit: BoxFit.fill,

            imageUrl: eventModel.bannerUrl,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 3,
          right: 10,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.more_vert_outlined,
                color: AppColors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
