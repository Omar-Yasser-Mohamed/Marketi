import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/features/home/presentation/args/products_args.dart';
import 'package:marketi/features/home/presentation/widgets/products_bloc_builder_states.dart';
import 'package:marketi/features/home/presentation/widgets/search_button.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as ProductsArgs;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ArrowBackButton(),
        ),
        leadingWidth: 70.p,
        title: Text(
          data.title,
          style: AppTextStyles.enM20.copyWith(
            color: context.textColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 14.p,
              right: 14.p,
              top: 8,
              bottom: 8,
            ),
            child: const SearchButton(),
          ),
          const Expanded(child: ProductsBlocBuilderStates()),
        ],
      ),
    );
  }
}
