import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ArrowBackButton(),

        const SizedBox(width: 16),

        Text(
          title,
          style: AppTextStyles.enM16.copyWith(
            color: context.textColor,
          ),
        ),
      ],
    );
  }
}
