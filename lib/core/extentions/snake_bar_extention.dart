import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

extension SnakeBarExtention on BuildContext {
  // Suucess snake bar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnakbar({
    required String message,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff009F00),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffC3F2BA),
                width: 6,
              ),
              color: const Color(0xff009F00),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AppIcons.accept,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              message,
              style: AppTextStyles.enM14,
            ),
          ),
        ],
      ),
    ),
  );

  // Error snake bar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnakbar({
    required String message,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xffEE3434),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 100, 100),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              message,
              style: AppTextStyles.enM14,
            ),
          ),
        ],
      ),
    ),
  );
}
