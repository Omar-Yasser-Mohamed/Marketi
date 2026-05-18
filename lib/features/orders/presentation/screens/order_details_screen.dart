import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_details_screen_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = GoRouterState.of(context).extra as OrderEntity;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.pop();
          },
        ),
        toolbarHeight: 64,
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              context.l10n.orderDetails,
              style: AppTextStyles.enSb20,
            ),
            Text(
              '#${order.orderNumber}',
              style: AppTextStyles.normalTextStyle,
            ),
          ],
        ),
        backgroundColor: context.backgroundColor,
        elevation: 4,
        scrolledUnderElevation: 4,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.primary.withValues(alpha: 0.04),
      ),
      body: const OrderDetailsScreenBody(),
    );
  }
}
