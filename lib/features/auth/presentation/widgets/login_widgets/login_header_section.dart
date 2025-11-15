import 'package:flutter/widgets.dart';
import 'package:marketi/core/app_assets/app_images.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        right: 30,
        left: 30,
        top: 114,
      ),
      child: Image.asset(
        AppImages.logoLogin,
      ),
    );
  }
}
