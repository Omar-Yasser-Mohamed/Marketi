import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_arrow_back_icon_button.dart';
import 'package:marketi/core/widgets/profile_item.dart';

class CustomCenterAppBar extends StatelessWidget {
  const CustomCenterAppBar({
    super.key,
    required this.title,
    this.showArrowButton = true,
  });
  final String title;
  final bool showArrowButton;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const ProfileItem(),
      ],
    );
  }
}
