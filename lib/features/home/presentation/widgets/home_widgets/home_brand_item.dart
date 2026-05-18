import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';

class HomeBrandItem extends StatelessWidget {
  const HomeBrandItem({
    super.key,
    required this.brand,
  });

  final BrandEntity brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.brandProductsScreen,
          extra: brand,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightBlue700.withValues(alpha: .7),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomNetworkImage(imageUrl: brand.image),
      ),
    );
  }
}
