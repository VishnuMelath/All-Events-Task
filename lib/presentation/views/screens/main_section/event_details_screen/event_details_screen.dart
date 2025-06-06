import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_app_bar.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/highlights_tile.dart';
import 'package:all_events_task/presentation/views/shared/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: AnimationLimiter(
        child: ListView(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              EdAppBar(eventModel: event),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.eventName,
                      style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        const Icon(Icons.nat),
                        Text(
                          'Organized by ${event.location}',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
                          ),
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
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(right: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: AppColors.backgroundColor,
                                ),
                                color: Colors.amber,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(right: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: AppColors.backgroundColor,
                                ),
                                color: Colors.green,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: AppColors.backgroundColor,
                                ),
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: AppColors.backgroundColor,
                                ),
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('View all'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.star_border_rounded,
                                  size: 15,
                                  color: AppColors.grey,
                                ),
                                Text('Interested'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(Icons.file_upload_outlined, size: 15),
                                Text('Share'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Consumer(
                      builder: (context, ref, _) {
                        return CustomButton(
                          label: 'Book Tickets',
                          borderRadius: 0,
                          onTap: () {
                            ref.read(progressNotifier.notifier).state = 0;
                            ref.read(isWebViewLoading.notifier).state = true;
                            context.pushNamed(
                              AppRouteNames.purchaseTicketScreen,
                              extra: event.tickets.ticketUrl,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 40),
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
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 0.3,
                              ),
                            ),
                            child: Text(e),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      event.eventNameRaw,
                      style: const TextStyle(color: AppColors.grey),
                    ),
                    const Text(
                      '3rd addition',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    Text(
                      'Marathon date ${event.startTimeDisplay}\n\n',
                      style: const TextStyle(color: AppColors.grey),
                    ),

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
                    Text(
                      'Date & Time',
                      style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
                    ),
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.timer_sharp,
                          color: AppColors.primaryColor,
                          size: 15,
                        ),
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

                    const Divider(thickness: 0.15, height: 30),
                    Text(
                      'Date & Time',
                      style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
                    ),
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primaryColor,
                          size: 15,
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
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 0.15, height: 30),
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              border: Border.all(width: 0.15),
                            ),
                            child: const Icon(
                              Icons.hail,
                              color: Colors.redAccent,
                            ),
                          ),
                          Text(
                            'Guru athletics Academy',
                            style: AppTextStyles.lufgaSemiBold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const Row(
                            spacing: 5,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '371 Follower',
                                style: TextStyle(color: AppColors.grey),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: 15,
                              ),
                              Text(
                                '3.67',
                                style: TextStyle(color: AppColors.grey),
                              ),
                            ],
                          ),
                          const Text('1 Upcoming Event'),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: Row(
                              spacing: 15,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    borderRadius: 0,
                                    label: 'Follow',
                                    onTap: () {},
                                  ),
                                ),
                                Expanded(
                                  child: CustomButton(
                                    buttonColor: ButtonColor.white,
                                    borderRadius: 0,
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
                    const Divider(thickness: 0.15, height: 30),
                    const Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primaryColor,
                          size: 14,
                        ),
                        Text(
                          'Add to Curated',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        Spacer(),
                        Icon(Icons.flag_outlined, color: Colors.red, size: 14),
                        Text(
                          'Add to Curated',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const Divider(thickness: 0.15, height: 20),
                    Text(
                      'Events You may like',
                      style: AppTextStyles.lufgaSemiBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.sizeOf(context).width - 50,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  'https://cdn2.allevents.in/thumbs/thumb5b903cb6755e8.png',
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  margin: const EdgeInsets.only(top: 15),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sat 4, Jan',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Unboxed Game Fest 2025',
                                        style: AppTextStyles.lufgaSemiBold
                                            .copyWith(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Text(
                                        'Ahmedabad Management Association AMA Ahmedabad Management',
                                        style: TextStyle(color: AppColors.grey),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  top: 0,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: AppColors.lightGrey,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.star_border,
                                      color: AppColors.grey,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
