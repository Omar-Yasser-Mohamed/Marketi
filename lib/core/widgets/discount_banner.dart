import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiscountClipper(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.lightBlue700.withValues(alpha: .7),
        ),
        child: Text(
          "15% OFF",
          style: AppTextStyles.enM12.copyWith(
            color: context.textColor,
          ),
        ),
      ),
    );
  }
}

class DiscountClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 8, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
