import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_button.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({
    super.key,
    required this.numberOfItem,
    required this.totalPrice,
  });

  final num numberOfItem;
  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorStyles.lightBlue700.withValues(alpha: .7),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suptotal (${numberOfItem.toString()} items)',
                style: TextStyles.enSb16,
              ),
              Text(
                'EGP ${totalPrice.toStringAsFixed(2)}',
                style: TextStyles.enSb16,
              ),
            ],
          ),

          const SizedBox(height: 14),

          CustomButton(
            onPressed: () {},
            text: 'Checkout',
          ),
        ],
      ),
    );
  }
}
