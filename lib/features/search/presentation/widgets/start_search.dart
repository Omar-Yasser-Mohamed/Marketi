import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class StartSearch extends StatelessWidget {
  const StartSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),

          Image.asset(
            AppImages.empty,
            fit: BoxFit.fill,
            height: height * .31,
          ),

          const SizedBox(height: 22),

          Text(
            'Start Search Now...',
            style: TextStyles.enM26.copyWith(
              color: ColorStyles.darkBlue900,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
