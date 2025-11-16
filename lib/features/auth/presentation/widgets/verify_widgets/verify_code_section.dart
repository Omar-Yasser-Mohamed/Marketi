import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeSection extends StatefulWidget {
  const VerifyCodeSection({super.key});

  @override
  State<VerifyCodeSection> createState() => _VerifyCodeSectionState();
}

class _VerifyCodeSectionState extends State<VerifyCodeSection> {
  late final TextEditingController _otpController;

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 60,
    textStyle: TextStyles.enM32.copyWith(
      color: ColorStyles.darkBlue900,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ColorStyles.lightBlue700),
    ),
  );

  @override
  void initState() {
    super.initState();

    _otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Pinput(
          length: 6,
          controller: _otpController,
          defaultPinTheme: defaultPinTheme,
        ),

        const SizedBox(height: 22),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.changePassword);
            },
            text: 'Verify Code',
          ),
        ),

        const SizedBox(height: 22),

        const Text(
          '00:46',
          style: TextStyles.enSb16,
        ),
        const SizedBox(height: 22),

        InkWell(
          onTap: () {},
          child: const Text(
            'Resend Code',
            style: TextStyles.enSb16,
          ),
        ),
      ],
    );
  }
}
