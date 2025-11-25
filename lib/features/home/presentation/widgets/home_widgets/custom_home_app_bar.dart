import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/profile_item.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfileItem(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Hi Yousef !',
              style: TextStyles.enM24.copyWith(
                color: ColorStyles.darkBlue900,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            AppIcons.notification,
            height: 30,
          ),
        ),
      ],
    );
  }
}
