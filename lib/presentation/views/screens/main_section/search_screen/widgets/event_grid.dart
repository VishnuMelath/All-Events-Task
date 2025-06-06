import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/views/shared/widgets/custom_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventGrid extends StatelessWidget {
  final EventModel event;
  const EventGrid({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouteNames.eventDetailsScreen, extra: event);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Container(
            width: double.infinity,
            height: (MediaQuery.sizeOf(context).width / 2) - 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(event.thumbUrl),
              ),
            ),
          ),
          Expanded(
            child: Text(
              event.eventName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.lufgaSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}

class EventGridLaoding extends StatelessWidget {
  const EventGridLaoding({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Container(
            width: double.infinity,
            height: (MediaQuery.sizeOf(context).width / 2) - 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: Text(
              'Loading',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.lufgaSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
