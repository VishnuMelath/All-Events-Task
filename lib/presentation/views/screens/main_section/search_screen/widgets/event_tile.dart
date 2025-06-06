import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/views/shared/widgets/custom_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const tempImageUrl =
    'https://cdn-az.allevents.in/banners/25d207e0-af31-11e8-81c9-1b431fd718bc-rimg-w400-h400-dc2b70b7-gmir.jpg';

class EventTile extends StatelessWidget {
  final EventModel event;
  const EventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouteNames.eventDetailsScreen, extra: event);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(event.thumbUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    event.location,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    maxLines: 1,
                  ),
                  const Divider(height: 20, thickness: .15),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Text(
                          event.startTimeDisplay
                              .split(' ')
                              .getRange(0, 4)
                              .join(' '),
                          style: const TextStyle(color: Colors.black54, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.star_border_rounded, color: AppColors.grey),
                      const Icon(Icons.file_upload_outlined, color: AppColors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventTileLoading extends StatelessWidget {
  const EventTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          CustomShimmer(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(
                  child: Text(
                    'Loading',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                CustomShimmer(
                  child: Text(
                    'Loading',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                    maxLines: 1,
                  ),
                ),
                Divider(height: 20, thickness: .15),
                CustomShimmer(
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Text(
                          'Loading',
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.star_border_rounded, color: AppColors.grey),
                      Icon(Icons.file_upload_outlined, color: AppColors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
