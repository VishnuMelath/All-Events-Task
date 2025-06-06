import 'dart:async';
import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/screens/main_section/search_screen/widgets/event_grid.dart';
import 'package:all_events_task/presentation/views/screens/main_section/search_screen/widgets/event_tile.dart';
import 'package:all_events_task/presentation/views/shared/widgets/animating_search_bar.dart';
import 'package:all_events_task/utils/methods/capitalize_first_letter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return Material(
      // color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.2,
            filterQuality: FilterQuality.low,

            image: AssetImage('assets/images/login_bg.jpg'),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          spacing: 20,
                          children: [
                            GestureDetector(
                              onTap: context.pop,
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppColors.white,
                              ),
                            ),
                            Expanded(
                              child: Consumer(
                                builder: (context, ref, _) {
                                  return Text(
                                    '${capitalizeFirst(ref.watch(eventProvider).currentCategory?.category ?? 'All')}  Events in Ahmedabad',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Consumer(
                          builder: (context, ref, _) {
                            return AnimatingSearchBar(
                              onChanged: (value) {
                                timer?.cancel();
                                timer = Timer(
                                  const Duration(milliseconds: 500),
                                  () {
                                    ref
                                        .read(eventProvider)
                                        .getEvents(query: value);
                                  },
                                );
                              },
                              textEditingController: TextEditingController(),
                              isHome: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: AppColors.backgroundColor,
                  child: Consumer(
                    builder: (context, ref, _) {
                      var isLoading = ref.read(eventProvider).isEventsLoading;
                      var events = ref.read(eventProvider).events;

                      return Column(
                        children: [
                          Row(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text: const TextSpan(
                                    text: 'Events around ',

                                    style: TextStyle(
                                      fontFamily: 'Lufga',
                                      color: AppColors.black,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Ahmedabad',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  ref.read(isGridProvider.notifier).state = !ref
                                      .read(isGridProvider);
                                },
                                child: Icon(
                                  ref.watch(isGridProvider)
                                      ? Icons.grid_view_rounded
                                      : Icons.list,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: isLoading == false && events == null
                                ? const Center(
                                    child: Text('Something went wrong'),
                                  )
                                : (events?.isEmpty ?? false)
                                ? const Center(
                                    child: Text('Oops! No Events found'),
                                  )
                                : ref.watch(isGridProvider)
                                ? AnimationLimiter(
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 15,
                                          ),
                                      itemCount:
                                          ref
                                              .watch(eventProvider)
                                              .events
                                              ?.length ??
                                          4,
                                      itemBuilder: (context, index) {
                                        return AnimationConfiguration.staggeredGrid(
                                          position: index,
                                          columnCount: 2,
                                          duration: const Duration(
                                            milliseconds: 500,
                                          ),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: isLoading
                                                  ? const EventGridLaoding()
                                                  : EventGrid(
                                                      event: events![index],
                                                    ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : AnimationLimiter(
                                    child: ListView.builder(
                                      itemCount:
                                          ref
                                              .watch(eventProvider)
                                              .events
                                              ?.length ??
                                          4,
                                      itemBuilder: (context, index) {
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(
                                            milliseconds: 500,
                                          ),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: isLoading
                                                  ? const EventTileLoading()
                                                  : EventTile(
                                                      event: ref
                                                          .read(eventProvider)
                                                          .events![index],
                                                    ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
