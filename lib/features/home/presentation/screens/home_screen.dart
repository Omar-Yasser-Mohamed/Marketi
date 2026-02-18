import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/offers_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          8.verticalSizedBox,

          // hi & search
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.p),
            child: const HomeHeader(),
          ),

          14.verticalSizedBox,

          // Offers
          const OffersCarousel(),
        ],
      ),
    );
  }
}
