import 'package:flutter/widgets.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/widgets/Custom_text_form_field.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_password_text_form_field.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/forget_password_button.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: CustomTextFormField(
            iconImage: AppIcons.email,
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 14),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: CustomPasswordTextFormField(),
        ),
        const SizedBox(height: 6),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ForgetPasswordButton(),
            SizedBox(
              width: 22,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomButton(
            onPressed: () {},
            text: 'Log In',
          ),
        ),
      ],
    );
  }
}