import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({super.key});

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> offers = [
    AppImages.offer1,
    AppImages.offer2,
    AppImages.offer3,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: offers.length,
          options: CarouselOptions(
            height: 150.h,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            enlargeCenterPage: true,
            viewportFraction: 0.92,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                offers[index],
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: offers.length,
          effect: const ExpandingDotsEffect(),
          onDotClicked: (index) {
            _controller.animateToPage(index);
          },
        ),
      ],
    );
  }
}
