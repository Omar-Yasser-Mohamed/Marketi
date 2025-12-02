import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/all_categories_screen_body.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllCategoriesScreenBody(),
    );
  }
}