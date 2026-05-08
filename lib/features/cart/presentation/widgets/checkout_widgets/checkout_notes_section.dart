import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';

class CheckoutNotesSection extends StatelessWidget {
  const CheckoutNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.notes,
          style: AppTextStyles.enSb16.copyWith(color: context.textColor),
        ),

        12.verticalSizedBox,

        CustomTextFormField(
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.notes_rounded,
                color: context.textColor,
              ),
            ],
          ),
          hintText: context.l10n.notesHint,
          maxLines: 2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: AppColors.lightBlue700.withValues(alpha: .7),
            ),
          ),
        ),
      ],
    );
  }
}
