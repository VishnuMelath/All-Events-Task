import 'dart:ui';

import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/config/themes/textstyles.dart';
import 'package:all_events_task/data/data_sources/user_sources.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/screens/main_section/home_screen/widgets/categories_bottom_sheet.dart';
import 'package:all_events_task/presentation/views/screens/main_section/home_screen/widgets/category_grid.dart';
import 'package:all_events_task/presentation/views/shared/widgets/animating_search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primaryColor, Color.fromARGB(255, 246, 246, 246)],
          stops: [0, 0.4],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 5,
                children: [
                  const Image(
                    width: 30,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  const Text(
                    'Ahmedabad',
                    style: TextStyle(fontSize: 15, color: AppColors.white),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColors.white,
                  ),
                  // Expanded(
                  // //   child: UnconstrainedBox(
                  // //     alignment: Alignment.centerLeft,
                  // //     child: Column(
                  // //       crossAxisAlignment: CrossAxisAlignment.end,
                  // //       children: [
                  // //         Text('Hey welcome!', style: TextStyle(fontSize: 12)),
                  // //         Text(
                  // //           UserSources.name ?? '',
                  // //           style: AppTextStyles.lufgaSemiBold.copyWith(
                  // //             fontSize: 25,
                  // //             overflow: TextOverflow.ellipsis,
                  // //           ),
                  // //           maxLines: 1,
                  // //         ),
                  // //       ],
                  // //     ),
                  // //   ),
                  // // ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: CachedNetworkImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          width: 35,
                          height: 35,
                          imageUrl:
                              UserSources.profileImage ??
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 28),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: const Icon(Icons.notifications),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                'Find your faorite Events',
                style: TextStyle(fontSize: 25),
              ),
              AnimatingSearchBar(
                onChanged: (value) {},
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  showCategoriesBottomSheet(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 10, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore Categories ',
                        style: AppTextStyles.lufgaSemiBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  var isLoading = ref.watch(eventProvider).isCategoriesLoading;
                  var categories = ref.read(eventProvider).categories;

                  if (!isLoading && categories == null) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(eventProvider).getCategories();
                      },
                      child: const Text(
                        'Failed to load categories\nTap to refresh',
                      ),
                    );
                  } else {
                    return AnimationLimiter(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: isLoading
                            ? 4
                            : ref.read(eventProvider).categories?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.9,
                            ),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: 2,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: isLoading
                                    ? const CategoryLoadingGrid()
                                    : CategoryGrid(
                                        categoryModel: categories![index],
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
