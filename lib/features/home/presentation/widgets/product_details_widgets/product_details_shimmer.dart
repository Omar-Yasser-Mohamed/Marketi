import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.isLightMode ? Colors.grey[300]! : Colors.grey[800]!,
      highlightColor: context.isLightMode ? Colors.grey[100]! : Colors.grey[600]!,
      child: Column(
        children: [
          38.verticalSpace,
          // AppBar Shimmer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 14),
              children: [
                // Main Image
                Container(
                  height: 300.h,
                  color: Colors.white,
                ),
                16.verticalSizedBox,
                
                // Dots
                Center(
                  child: Container(
                    width: 50,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                
                16.verticalSizedBox,
                
                // Thumbnails
                SizedBox(
                  height: 56,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 14),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 56.h,
                        width: 56.h,
                        margin: const EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),
                ),
                
                28.verticalSizedBox,
                
                // Details Section
                Container(
                  padding: EdgeInsets.only(left: 14.p, right: 14.p, top: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 20, width: 200, color: Colors.white),
                      12.verticalSizedBox,
                      Container(height: 16, width: 100, color: Colors.white),
                      12.verticalSizedBox,
                      Container(height: 24, width: 150, color: Colors.white),
                      16.verticalSizedBox,
                      Container(height: 14, width: double.infinity, color: Colors.white),
                      8.verticalSizedBox,
                      Container(height: 14, width: double.infinity, color: Colors.white),
                      8.verticalSizedBox,
                      Container(height: 14, width: 250, color: Colors.white),
                      24.verticalSizedBox,
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      24.verticalSizedBox,
                      Container(height: 20, width: 150, color: Colors.white),
                      12.verticalSizedBox,
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      24.verticalSizedBox,
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Bar
          Container(
            height: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
