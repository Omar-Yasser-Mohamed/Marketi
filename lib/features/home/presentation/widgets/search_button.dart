import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onTap: () {
        context.push(AppRoutes.searchScreen);
      },
      readOnly: true,
      hintText: context.l10n.searchHint,
      prefixIcon: Icon(
        Icons.search,
        size: 30,
        color: context.textColor,
      ),
    );
  }
}
