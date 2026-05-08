import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class CheckoutDeliveryTimeSection extends StatelessWidget {
  const CheckoutDeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.deliveryTime,
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
                AppIcons.deliveryIcon,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  context.textColor,
                  BlendMode.srcIn,
                ),
              ),

              14.horizontalSizedBox,

              Text(
                context.l10n.withinTwoDays,
                style: AppTextStyles.enM14.copyWith(
                  color: context.textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
