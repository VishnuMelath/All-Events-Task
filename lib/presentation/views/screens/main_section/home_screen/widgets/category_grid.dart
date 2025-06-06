import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/domain/models/category_model.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/shared/widgets/custom_shimmer.dart';
import 'package:all_events_task/utils/methods/capitalize_first_letter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryGrid extends ConsumerWidget {
  final CategoryModel categoryModel;
  const CategoryGrid({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(eventProvider).currentCategory = categoryModel;
        ref.read(eventProvider).getEvents();
        context.pushNamed(AppRouteNames.searchScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 1,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(categoryModel.image),
                ),
              ),
            ),
          ),
          Text(capitalizeFirst(categoryModel.category)),
        ],
      ),
    );
  }
}

class CategoryLoadingGrid extends StatelessWidget {
  const CategoryLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Expanded(
          child: CustomShimmer(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        const CustomShimmer(child: Text('Loading')),
      ],
    );
  }
}
