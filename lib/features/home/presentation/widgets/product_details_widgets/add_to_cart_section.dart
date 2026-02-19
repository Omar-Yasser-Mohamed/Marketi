import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/add_to_cart_button.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.p, right: 14.p, bottom: 24, top: 8),
      decoration: BoxDecoration(
        color: context.backgroundColor,
      ),
      child: Row(
        children: [
          // price
          Column(
            children: [
              Text(
                context.l10n.price,
                style: AppTextStyles.enM18.copyWith(
                  color: context.textColor,
                ),
              ),
              Text(
                "345.00 EGP",
                style: AppTextStyles.enM18.copyWith(
                  color: context.textColor,
                ),
              ),
            ],
          ),

          8.horizontalSizedBox,

          // Add to cart button
          Expanded(
            child: AddToCartButton(
              height: 48.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: context.logoColor,
                    size: 24,
                  ),

                  4.horizontalSizedBox,

                  Text(
                    context.l10n.addToCart,
                    style: AppTextStyles.enM14.copyWith(
                      color: context.logoColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
