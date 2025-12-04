import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/custom_home_app_bar.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomHomeAppBar(),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.searchScreen);
          },
          child: const CustomSearchTextField(
            enabled: false,
          ),
        ),
      ],
    );
  }
}
