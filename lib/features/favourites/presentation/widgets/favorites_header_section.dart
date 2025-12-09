import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';

class FavoritesHeaderSection extends StatelessWidget {
  const FavoritesHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomCenterAppBar(
            title: 'Favorites',
            showArrowButton: false,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.searchScreen);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: CustomSearchTextField(
                enabled: false,
              ),
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
