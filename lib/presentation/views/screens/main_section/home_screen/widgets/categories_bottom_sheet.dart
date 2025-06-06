import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/utils/methods/capitalize_first_letter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future showCategoriesBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) => const CategoriesBottomSheet(),
  );
}

class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            var isLoading = ref.watch(eventProvider).isCategoriesLoading;
            var categories = ref.read(eventProvider).categories;

            return isLoading
                ? const SizedBox()
                : categories == null
                ? const Text('Something went wrong')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Choose Your Preferred ',
                          style: TextStyle(
                            fontFamily: 'Lufga',
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: 'Category',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...categories.map(
                        (e) => InkWell(
                          onTap: () {
                            ref.read(eventProvider).currentCategory = e;
                            ref.read(eventProvider).getEvents();
                            context.pop();
                            context.pushNamed(AppRouteNames.searchScreen);
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: AssetImage(e.image),
                                        ),
                                      ),
                                    ),
                                    Text(capitalizeFirst(e.category)),
                                  ],
                                ),
                              ),
                              if (categories.last.category != e.category)
                                const Divider(thickness: 0.3, height: 0),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
