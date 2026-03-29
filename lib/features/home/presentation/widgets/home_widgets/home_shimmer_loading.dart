import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/widgets/product_shimmer_item.dart';
import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_factory.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strategy = CategoriesGridFactory.getStrategy(context.screenWidth);
    return ListView(
      children: [
        8.verticalSizedBox,

        // name shimmer
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Align(
            alignment: context.isArabic
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.p),
              width: 150,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),

        14.verticalSizedBox,

        // search bar shimmer
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14.p),
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        14.verticalSizedBox,

        // Offer shimmer
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14.p),
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        14.verticalSizedBox,

        // Title shimmer
        const HomeTitleShimmerLoading(),

        8.verticalSizedBox,

        //product items shimmer
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 14.p),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ProductShimmerItem();
            },
          ),
        ),

        14.verticalSizedBox,

        const HomeTitleShimmerLoading(),

        8.verticalSizedBox,

        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 14.p),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: strategy.getCrossAxisCount(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
            childAspectRatio: strategy.getChildAspectRatio(),
          ),
          itemCount: strategy.getCrossAxisCount() * 2,
          itemBuilder: (context, index) {
            return LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: constraints.maxHeight * .65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  4.verticalSizedBox,

                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 20.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class HomeTitleShimmerLoading extends StatelessWidget {
  const HomeTitleShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.p),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // title shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 30.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          // view all shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 22.h,
              width: 66.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
