import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/domain/models/event_model.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_about_section.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_app_bar.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_datesection.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_location_section.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_organisation_section.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/ed_suggestion_section.dart';
import 'package:all_events_task/presentation/views/screens/main_section/event_details_screen/widget/highlight_section.dart';
import 'package:all_events_task/presentation/views/shared/widgets/custom_button.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
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
                        style: AppTextStyles.lufgaSemiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      HighlightSection(event: event),

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
                      EdAboutSection(event: event),
                      EdDatesection(event: event),
                      EdLocationSection(event: event),
                      EdOrganisationSection(event: event),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColors.primaryColor,
                            size: 14,
                          ),
                          Text(
                            ' Add to Curated',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          Spacer(),
                          Icon(
                            Icons.flag_outlined,
                            color: Colors.red,
                            size: 14,
                          ),

                          Text(
                            ' Report Event',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const EdSuggestionSection(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
