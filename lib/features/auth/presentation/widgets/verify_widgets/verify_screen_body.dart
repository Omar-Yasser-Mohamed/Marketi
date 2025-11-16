import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_normal_app_bar.dart';
import 'package:marketi/features/auth/presentation/widgets/verify_widgets/verify_code_section.dart';
import 'package:marketi/features/auth/presentation/widgets/verify_widgets/verify_header_section.dart';

class VerifyScreenBody extends StatelessWidget {
  const VerifyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 44),
        const CustomNormalAppBar(
          title: 'Verification Code',
        ),
        Expanded(
          child: ListView(
            children: const [
              VerifyHeaderSection(),
              VerifyCodeSection(),
            ],
          ),
        ),
      ],
    );
  }
}
