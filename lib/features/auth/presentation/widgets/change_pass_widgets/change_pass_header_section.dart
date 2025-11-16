import 'package:flutter/widgets.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/text_styles.dart';

class ChangePassHeaderSection extends StatelessWidget {
  const ChangePassHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.createNewPassword,
          height: MediaQuery.of(context).size.height * .33,
        ),
        const SizedBox(height: 22),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            'New password must be different from last password',
            style: TextStyles.enM20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
