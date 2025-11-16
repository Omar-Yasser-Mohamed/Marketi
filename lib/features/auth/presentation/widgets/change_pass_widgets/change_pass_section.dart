import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_password_text_form_field.dart';

class ChangePassSection extends StatelessWidget {
  const ChangePassSection({super.key});

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
                "Password",
                style: TextStyles.enM14,
              ),
              SizedBox(height: 2),
              CustomPasswordTextFormField(),
              SizedBox(height: 4),

              Text(
                "Confirm Password",
                style: TextStyles.enM14,
              ),
              SizedBox(height: 2),
              CustomPasswordTextFormField(
                hint: 'Confirm Password',
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        CustomButton(
          onPressed: () {
            GoRouter.of(context).go(Routes.congratsUpdatedPass);
          },
          text: 'Save Password',
        ),
      ],
    );
  }
}
