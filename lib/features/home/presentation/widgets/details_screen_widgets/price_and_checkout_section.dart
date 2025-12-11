import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_add_button.dart';

class PriceAndCheckoutSection extends StatelessWidget {
  const PriceAndCheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, right: 14, left: 14, bottom: 24),
      decoration: const BoxDecoration(
        color: Color(0xffF5FBFF),
        border: Border(
          top: BorderSide(color: ColorStyles.lightBlue700),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Price\n345.00 EGP',
            textAlign: TextAlign.center,
            style: TextStyles.enM18,
          ),
          const SizedBox(width: 8),

          Expanded(
            child: CustomAddButton(
              height: 52,
              radius: 14,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 24,
                    color: ColorStyles.primary,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    'Add to cart',
                    style: TextStyles.enM14.copyWith(
                      color: ColorStyles.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
