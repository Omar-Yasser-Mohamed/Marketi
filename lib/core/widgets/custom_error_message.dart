import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.enM18.copyWith(
          color: ColorStyles.darkBlue900,
        ),
      ),
    );
  }
}