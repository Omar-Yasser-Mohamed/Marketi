import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/cart_item.dart';
import 'package:marketi/core/widgets/custom_arrow_back_icon_button.dart';
import 'package:marketi/core/widgets/profile_item.dart';

class CustomCenterAppBar extends StatelessWidget {
  const CustomCenterAppBar({
    super.key,
    required this.title,
    this.showArrowButton = true,
    this.withShadow = false,
    this.showCart = false,
  });
  final String title;
  final bool showArrowButton;
  final bool withShadow;
  final bool showCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: withShadow
            ? Border(
                bottom: BorderSide(
                  color: ColorStyles.lightBlue700.withValues(alpha: .2),
                ),
              )
            : null,
        boxShadow: withShadow
            ? [
                BoxShadow(
                  color: ColorStyles.lightBlue700.withValues(alpha: .2),
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          showArrowButton
              ? const CustomArrowBackIconButton()
              : const SizedBox(width: 52),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.enSb22.copyWith(
                color: ColorStyles.darkBlue900,
              ),
            ),
          ),
          showCart
              ? const CartItem()
              : const ProfileItem(),
        ],
      ),
    );
  }
}

