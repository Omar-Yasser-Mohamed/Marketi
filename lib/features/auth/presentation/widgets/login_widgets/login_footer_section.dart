import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you new in Marketi ',
              style: TextStyles.normalTextStyle.copyWith(
                color: ColorStyles.navy,
              ),
            ),

            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routes.register);
              },
              child: Text(
                'register?',
                style: TextStyles.normalTextStyle.copyWith(
                  color: ColorStyles.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}