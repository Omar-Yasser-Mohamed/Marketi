import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/cart/presentation/widgets/location_widgets/view_location_on_map.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.address,
          style: AppTextStyles.enSb16.copyWith(
            color: context.textColor,
          ),
        ),

        12.verticalSizedBox,

        Container(
          height: 200.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightBlue700.withValues(alpha: .7),
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              // Map
              const Expanded(
                child: ViewLocationOnMap(
                  lat: 40.69813171386719,
                  lng: 30.312728881835938,
                ),
              ),

              // Data & Change Address
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: context.textColor,
                    ),

                    8.horizontalSizedBox,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.home,
                                style: AppTextStyles.enSb16.copyWith(
                                  color: context.textColor,
                                ),
                              ),

                              Text(
                                context.l10n.change,
                                style: AppTextStyles.enSb16.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),

                          2.verticalSizedBox,

                          Text(
                            "location",
                            style: AppTextStyles.enM14.copyWith(
                              color: context.textColor,
                            ),
                          ),

                          2.verticalSizedBox,

                          Text(
                            "${context.l10n.mobile}: 01000000000",
                            style: AppTextStyles.enM14.copyWith(
                              color: context.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
