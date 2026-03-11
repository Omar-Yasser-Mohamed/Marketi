import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreenShimmer extends StatelessWidget {
  const ProfileScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.p),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                color: context.isLightMode
                    ? Colors.grey.shade100
                    : AppColors.customBlack2,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 24,
              width: 100,
              decoration: BoxDecoration(
                color: context.isLightMode
                    ? Colors.grey.shade100
                    : AppColors.customBlack2,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                color: context.isLightMode
                    ? Colors.grey.shade100
                    : AppColors.customBlack2,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: context.isLightMode
                    ? Colors.grey.shade100
                    : AppColors.customBlack2,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
