import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSection extends StatefulWidget {
  const ImagesSection({super.key});

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  late PageController pageController;

  int currentIndex = 0;

  List<String> images = [
    AppImages.productTest,
    AppImages.productTest,
    AppImages.productTest,
    AppImages.productTest,
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // images page view
        SizedBox(
          height: 300.h,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(images[index]);
            },
          ),
        ),

        // images indecator
        SmoothPageIndicator(
          controller: pageController,
          count: images.length,
          onDotClicked: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          effect: ExpandingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            dotColor: AppColors.lightBlue700,
            activeDotColor: context.isLightMode
                ? AppColors.darkBlue700
                : AppColors.primary,
          ),
        ),

        12.verticalSizedBox,

        SizedBox(
          height: 56,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 14),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  height: 56.h,
                  width: 56.h,
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: currentIndex == index ? 3 : 2,
                      color: currentIndex == index
                          ? (context.isLightMode
                                ? AppColors.darkBlue700
                                : AppColors.primary)
                          : AppColors.lightBlue700.withValues(alpha: .7),
                    ),
                  ),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 28),
      ],
    );
  }
}
