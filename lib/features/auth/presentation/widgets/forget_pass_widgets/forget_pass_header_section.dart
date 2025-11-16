import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/text_styles.dart';

class ForgetPassHeaderSection extends StatelessWidget {
  const ForgetPassHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.forgetPassword,
          height: MediaQuery.of(context).size.height * .33,
        ),
        const SizedBox(height: 22),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Please enter your email address to receive a verification code',
            style: TextStyles.enM20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
