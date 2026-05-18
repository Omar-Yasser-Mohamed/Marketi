import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/home/presentation/widgets/categories_grid_bloc_builder.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ArrowBackButton(),
        ),
        leadingWidth: 70.p,
        title: Text(
          context.l10n.categories,
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
            child: CustomTextFormField(
              readOnly: true,
              hintText: context.l10n.searchHint,
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: context.textColor,
              ),
            ),
          ),
          const Expanded(child: CategoriesGridBlocBuilder()),
        ],
      ),
    );
  }
}
