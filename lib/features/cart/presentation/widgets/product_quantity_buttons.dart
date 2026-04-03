import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';

class ProductQuantityButtons extends StatefulWidget {
  const ProductQuantityButtons({super.key, required this.product});
  final CartItemEntity product;

  @override
  State<ProductQuantityButtons> createState() => _ProductQuantityButtonsState();
}

class _ProductQuantityButtonsState extends State<ProductQuantityButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.product.count > 1)
          _buildCounterButton(
            context,
            AppIcons.minus,
            () {
              // setState(() {
              //   widget.product.count--;
              // });
            },
          ),
        if (widget.product.count == 1)
          _buildCounterButton(context, AppIcons.trush, () {}),
        8.horizontalSizedBox,

        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF5FBFF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "${widget.product.count}",
              style: AppTextStyles.enSb14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),

        8.horizontalSizedBox,

        _buildCounterButton(
          context,
          AppIcons.plus,
          () {
            // setState(() {
            //   quantity++;
            // });
          },
        ),
      ],
    );
  }

  Widget _buildCounterButton(
    BuildContext context,
    String svgIcon,
    void Function()? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightBlue900,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SvgPicture.asset(
          svgIcon,
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}
