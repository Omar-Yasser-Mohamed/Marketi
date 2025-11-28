import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/brand_item.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 6),

        BrandItem(),
        BrandItem(),
        BrandItem(),

        SizedBox(width: 6),
      ],
    );
  }
}
