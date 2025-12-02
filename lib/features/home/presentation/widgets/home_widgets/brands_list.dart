import 'package:flutter/material.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/brand_item.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({super.key, required this.brands});
  final List<BrandEntity> brands;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 6),
        for (int i = 0; i < 3; i++) BrandItem(brand: brands[i]),
        const SizedBox(width: 6),
      ],
    );
  }
}
