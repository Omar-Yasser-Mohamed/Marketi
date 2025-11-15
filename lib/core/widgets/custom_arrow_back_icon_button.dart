import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';

class CustomArrowBackIconButton extends StatelessWidget {
  const CustomArrowBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 14,
          bottom: 14,
          left: 18,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: ColorStyles.lightBlue700,
          ),
        ),
        child: SvgPicture.asset(AppIcons.arrowBack),
      ),
    );
  }
}
