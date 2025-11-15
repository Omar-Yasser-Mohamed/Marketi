import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        
      },
      child: Text(
        "Forget Password?",
        style: TextStyles.enM12.copyWith(
          color: ColorStyles.primary,
        ),
      ),
    );
  }
}
