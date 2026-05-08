import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.payment,
          style: AppTextStyles.enSb16.copyWith(
            color: context.textColor,
          ),
        ),

        12.verticalSizedBox,

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.lightBlue700.withValues(alpha: 0.7),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.cashIcon,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  context.textColor,
                  BlendMode.srcIn,
                ),
              ),

              12.horizontalSizedBox,

              Expanded(
                child: Text(
                  context.l10n.cashOnDelivery,
                  style: AppTextStyles.enM14.copyWith(
                    color: context.textColor,
                  ),
                ),
              ),

              Text(
                context.l10n.change,
                style: AppTextStyles.enSb14.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
