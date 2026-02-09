import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class PagesIndecator extends StatelessWidget {
  const PagesIndecator({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageIndicatorDot(isActive: currentPage == 0),
        PageIndicatorDot(isActive: currentPage == 1),
        PageIndicatorDot(isActive: currentPage == 2),
      ],
    );
  }
}

class PageIndicatorDot extends StatelessWidget {
  const PageIndicatorDot({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isActive ? 20.h : 16.h,
      height: isActive ? 20.h : 16.h,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: context.isLightMode
            ? (isActive ? AppColors.darkBlue900 : AppColors.lightBlue700)
            : (isActive ? AppColors.darkBlue100 : AppColors.lightBlue900),
        shape: BoxShape.circle,
      ),
    );
  }
}
