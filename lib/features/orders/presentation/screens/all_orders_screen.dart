import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/presentation/widgets/all_orders_widgets/orders_bloc_builder_states.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.myOrders,
          style: AppTextStyles.enSb20,
        ),
        backgroundColor: context.backgroundColor,
        elevation: 4,
        scrolledUnderElevation: 4,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.primary.withValues(alpha: 0.04),
      ),
      body: const OrdersBlocBuilderStates(),
    );
  }
}
