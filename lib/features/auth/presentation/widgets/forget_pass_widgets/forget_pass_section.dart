import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/Custom_text_form_field.dart';
import 'package:marketi/core/widgets/custom_button.dart';

class ForgetPassSection extends StatelessWidget {
  const ForgetPassSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Email",
                style: TextStyles.enM14,
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                hint: 'You@gmail.com',
                keyboardType: TextInputType.emailAddress,
                iconImage: AppIcons.email,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        CustomButton(
          onPressed: () {
            GoRouter.of(context).push(Routes.verifyScreen);
          },
          text: 'Send Code',
        ),
      ],
    );
  }
}
