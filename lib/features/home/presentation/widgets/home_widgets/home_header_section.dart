import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/custom_home_app_bar.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomHomeAppBar(),
        SizedBox(height: 14),
        CustomSearchTextField(),
      ],
    );
  }
}
