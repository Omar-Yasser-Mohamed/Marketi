import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/Custom_text_form_field.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_password_text_form_field.dart';

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

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
                "Your Name",
                style: TextStyles.enM12,
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                hint: 'Full Name',
                iconImage: AppIcons.username,
              ),
              SizedBox(height: 4),

              Text(
                "Phone Number",
                style: TextStyles.enM12,
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                hint: '+20 1068992625',
                keyboardType: TextInputType.phone,
                iconImage: AppIcons.phone,
              ),
              SizedBox(height: 4),

              Text(
                "Email",
                style: TextStyles.enM12,
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                hint: 'You@gmail.com',
                keyboardType: TextInputType.emailAddress,
                iconImage: AppIcons.email,
              ),
              SizedBox(height: 4),

              Text(
                "Password",
                style: TextStyles.enM12,
              ),
              SizedBox(height: 2),
              CustomPasswordTextFormField(),
              SizedBox(height: 4),

              Text(
                "Confirm Password",
                style: TextStyles.enM12,
              ),
              SizedBox(height: 2),
              CustomPasswordTextFormField(
                hint: 'Confirm Password',
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
        const SizedBox(height: 14),
        CustomButton(onPressed: () {}, text: 'Sign Up'),
      ],
    );
  }
}
