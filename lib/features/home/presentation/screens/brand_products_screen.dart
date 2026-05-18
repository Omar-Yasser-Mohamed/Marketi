import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/presentation/widgets/brand_products_widgets/brand_products_screen_body.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = GoRouterState.of(context).extra as BrandEntity;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ArrowBackButton(),
        ),
        leadingWidth: 70.p,
        title: Text(
          brand.name,
          style: AppTextStyles.enM20.copyWith(
            color: context.textColor,
          ),
        ),
      ),
      body: const BrandProductsScreenBody(),
    );
  }
}
