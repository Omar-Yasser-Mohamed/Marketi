import 'package:flutter/material.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_arrow_back_icon_button.dart';

class CustomNormalAppBar extends StatelessWidget {
  const CustomNormalAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 14),
          const CustomArrowBackIconButton(),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyles.enM20,
          ),
        ],
      ),
    );
  }
}
