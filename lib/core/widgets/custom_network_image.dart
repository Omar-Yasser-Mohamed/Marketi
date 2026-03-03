import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.errorWidget,
    this.width, this.height,
  });
  final String imageUrl;
  final BoxFit? fit;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? double.infinity,
      height: height,
      imageUrl: imageUrl,
      fit: fit,
      errorWidget: (context, url, error) {
        return errorWidget ??
            Image.asset(
              AppImages.noImageError,
            );
      },
    );
  }
}
