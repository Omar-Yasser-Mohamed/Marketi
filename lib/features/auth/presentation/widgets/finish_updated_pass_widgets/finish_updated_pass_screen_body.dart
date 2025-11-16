import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_button.dart';

class FinishUpdatedPassScreenBody extends StatelessWidget {
  const FinishUpdatedPassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 138),
        Image.asset(
          AppImages.congratulations,
          height: MediaQuery.of(context).size.height * .33,
        ),
        const SizedBox(height: 22),
        const Text(
          'Congratulations',
          style: TextStyles.enM28,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'You have updated the password. please login again with your latest password',
            style: TextStyles.enM18.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomButton(
            onPressed: () {
              GoRouter.of(context).go(Routes.login);
            },
            text: 'Log In',
          ),
        ),
      ],
    );
  }
}
