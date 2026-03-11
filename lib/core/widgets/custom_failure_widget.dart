import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/errors/error_model.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    super.key,
    required this.error,
  });

  final ErrorModel error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            error.image,
            height: 350.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.p),
            child: Text(
              error.message,
              textAlign: TextAlign.center,
              style: AppTextStyles.enSb16.copyWith(
                color: context.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
