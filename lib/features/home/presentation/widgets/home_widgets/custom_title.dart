import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 14),
        Text(
          title,
          style: TextStyles.enSb24,
        ),
        const Spacer(),
        InkWell(
          onTap: onPressed,
          child: Text(
            'View all',
            style: TextStyles.enM18.copyWith(
              color: ColorStyles.primary,
            ),
          ),
        ),
        const SizedBox(width: 14),
      ],
    );
  }
}
