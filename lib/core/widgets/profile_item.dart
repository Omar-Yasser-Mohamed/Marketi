import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/color_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorStyles.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            AppImages.test,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
