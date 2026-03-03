import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool showDesc = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showDesc = !showDesc;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: !showDesc
                  ? BorderRadius.circular(14)
                  : const BorderRadius.vertical(top: Radius.circular(14)),
              color: Colors.grey.withValues(alpha: .1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description",
                  style: AppTextStyles.enSb14.copyWith(
                    color: context.textColor,
                  ),
                ),

                Icon(
                  showDesc
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: context.textColor,
                ),
              ],
            ),
          ),
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Easing.standard,
          switchOutCurve: Easing.standard,
          child: showDesc
              ? Container(
                  key: const ValueKey("desc"),
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(14),
                    ),
                    color: Colors.grey.withValues(alpha: .1),
                  ),
                  child: Text(
                    widget.product.description,
                    style: AppTextStyles.normalTextStyle.copyWith(
                      color: context.textColor,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
