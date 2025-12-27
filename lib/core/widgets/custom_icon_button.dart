import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/theme/color_styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    this.icon,
    this.iconColor = ColorStyles.primary,
    this.iconSvg,
    this.width = 40,
  });
  final IconData? icon;
  final String? iconSvg;
  final void Function() onTap;
  final Color iconColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: ColorStyles.lightBlue900,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: icon == null
              ? SvgPicture.asset(iconSvg!)
              : Icon(
                  icon,
                  color: iconColor,
                ),
        ),
      ),
    );
  }
}
