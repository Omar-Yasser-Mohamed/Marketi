import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/validation_extention.dart';
import 'package:marketi/core/helpers/app_validators.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';

class EditSection extends StatelessWidget {
  const EditSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.isLightMode
            ? Colors.grey.shade100
            : AppColors.customBlack2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            context.l10n.full_name,
            style: AppTextStyles.enM14.copyWith(
              color: context.textColor,
            ),
          ),

          const SizedBox(height: 2),

          CustomTextFormField(
            hintText: context.l10n.full_name,
            keyboardType: TextInputType.name,
            validator: context.l10nValidator(AppValidators.name),
            prefixIcon: Icon(
              Icons.person_outline,
              color: context.textColor,
            ),
          ),

          const SizedBox(height: 12),

          // Email
          Text(
            context.l10n.email,
            style: AppTextStyles.enM14.copyWith(
              color: context.textColor,
            ),
          ),

          const SizedBox(height: 2),

          CustomTextFormField(
            hintText: context.l10n.email,
            keyboardType: TextInputType.emailAddress,
            validator: context.l10nValidator(AppValidators.email),
            prefixIcon: Icon(
              Icons.mail_outline,
              color: context.textColor,
            ),
          ),

          const SizedBox(height: 12),

          // phone number
          Text(
            context.l10n.phone_number,
            style: AppTextStyles.enM14.copyWith(
              color: context.textColor,
            ),
          ),
          const SizedBox(height: 2),
          CustomTextFormField(
            hintText: context.l10n.phone_number,
            keyboardType: TextInputType.phone,
            validator: context.l10nValidator(AppValidators.phone),
            prefixIcon: Icon(
              Icons.phone_android,
              color: context.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
