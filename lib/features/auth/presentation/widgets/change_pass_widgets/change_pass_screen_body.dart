import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_normal_app_bar.dart';
import 'package:marketi/features/auth/presentation/widgets/change_pass_widgets/change_pass_header_section.dart';
import 'package:marketi/features/auth/presentation/widgets/change_pass_widgets/change_pass_section.dart';

class ChangePassScreenBody extends StatelessWidget {
  const ChangePassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 44),
        const CustomNormalAppBar(
          title: 'Create New Password',
        ),
        Expanded(
          child: ListView(
            children: const [
              ChangePassHeaderSection(),
              SizedBox(height: 22),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ChangePassSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
