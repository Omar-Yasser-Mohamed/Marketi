import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class VerifyHeaderSection extends StatelessWidget {
  const VerifyHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.verificationCode,
          height: MediaQuery.of(context).size.height * .33,
        ),
        const SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Please enter the 6 digit code sent to: ',
              style: TextStyles.enM20.copyWith(
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'omary4576@gmail.com',
                  style: TextStyles.enM20.copyWith(
                    color: ColorStyles.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
