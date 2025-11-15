import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/widgets/custom_arrow_back_icon_button.dart';

class RegisterHeaderSection extends StatelessWidget {
  const RegisterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomArrowBackIconButton(),

        Image.asset(
          AppImages.logoSignUp,
          height: 187,
          fit: BoxFit.fill,
        ),

        const SizedBox(width: 52),
      ],
    );
  }
}
