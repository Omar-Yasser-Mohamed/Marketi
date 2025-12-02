import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.showAddButton = false,
    this.aspectRatio = 4 / 3.3,
    required this.product,
    this.margin = const EdgeInsets.only(right: 16),
  });
  final ProductEntity product;
  final bool showAddButton;
  final double aspectRatio;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ColorStyles.lightBlue700.withValues(alpha: .7),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  // color: ColorStyles.lightBlue900,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    // Image
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomNetworkImage(
                          imageUrl: product.image,
                        ),
                      ),
                    ),

                    // Discount
                    ClipPath(
                      clipper: _RightCutClipper(),
                      child: Container(
                        height: 24,
                        width: 82,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xffB2CCFF,
                          ).withValues(alpha: .4),
                        ),
                        child: Center(
                          child: Text(
                            '15% OFF',
                            style: TextStyles.enM14.copyWith(
                              color: ColorStyles.primary,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Fav Button
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 3,
                          bottom: 2,
                          right: 2,
                          left: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: ColorStyles.darkBlue900,
                          size: 21,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),

            Row(
              children: [
                const SizedBox(width: 4),
                Text(
                  '${product.price.toStringAsFixed(2)} LE',
                  style: TextStyles.enM14.copyWith(
                    color: ColorStyles.darkBlue900,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star_border_rounded,
                  color: ColorStyles.darkBlue900,
                ),
                const SizedBox(width: 2),
                Text(
                  '${product.avgRating}',
                  style: TextStyles.enM14.copyWith(
                    color: ColorStyles.darkBlue900,
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.enM14.copyWith(
                  color: ColorStyles.darkBlue900,
                ),
              ),
            ),

            // Add buttton
            showAddButton
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 4),

                      Container(
                        width: 120,
                        height: 28,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                color: ColorStyles.primary,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Add',
                            style: TextStyles.enM14.copyWith(
                              color: ColorStyles.primary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 2),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _RightCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0); // شمال فوق
    path.lineTo(size.width, 0); // يمين فوق
    path.lineTo(size.width - 12, size.height); // نزول لتحت شمال شوية
    path.lineTo(0, size.height); // شمال تحت
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
