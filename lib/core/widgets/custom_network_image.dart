import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
  });
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          imageUrl.contains(
            "https://ecommerce.routemisr.com",
          )
          ? imageUrl
          : "https://ecommerce.routemisr.com/Route-Academy-products/$imageUrl",
      fit: fit,
      width: width,
      height: height,
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
          size: 28,
        ),
      ),
    );
  }
}
