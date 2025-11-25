import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';

class OffersSlider extends StatefulWidget {
  const OffersSlider({super.key});

  @override
  State<OffersSlider> createState() => _OffersSliderState();
}

class _OffersSliderState extends State<OffersSlider> {
  final offers = [
    AppImages.offer1,
    AppImages.offer2,
    AppImages.offer3,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CarouselSlider.builder(
      itemCount: offers.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Image.asset(
            offers[index],
            fit: BoxFit.fill,
          ),
        );
      },
      options: CarouselOptions(
        height: height * .15,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
