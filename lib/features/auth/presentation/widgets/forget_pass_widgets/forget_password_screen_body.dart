import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_normal_app_bar.dart';
import 'package:marketi/features/auth/presentation/widgets/forget_pass_widgets/forget_pass_header_section.dart';
import 'package:marketi/features/auth/presentation/widgets/forget_pass_widgets/forget_pass_section.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 44),
        const CustomNormalAppBar(
          title: 'Forget Password',
        ),
        Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: const [
              ForgetPassHeaderSection(),
              SizedBox(height: 22),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ForgetPassSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
