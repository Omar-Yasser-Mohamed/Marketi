import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.icon,
    required this.title,
    this.color = ColorStyles.darkBlue900,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Container(
          height: height * 0.06,
          margin: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.06,
            bottom: 6,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xffDCDDE0),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),

              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.enM18,
                ),
              ),

              // Custom Arrow Forward Shape
              Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.only(
                  top: 6.5,
                  bottom: 6.5,
                  left: 9.1,
                  right: 8.2,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF5FBFF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorStyles.lightBlue700.withValues(alpha: 0.7),
                  ),
                ),
                child: SvgPicture.asset(
                  AppIcons.arrowForward,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
