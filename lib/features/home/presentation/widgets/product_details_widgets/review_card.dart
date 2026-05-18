import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/dynamic_rating_stars.dart';
import 'package:marketi/features/home/domain/entities/review_entity.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final ReviewEntity review;

  String _getInitials(String name) {
    if (name.trim().isEmpty) return "?";
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: .2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Text(
                    _getInitials(review.userName),
                    style: AppTextStyles.enSb16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              12.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.enSb16.copyWith(
                        color: context.textColor,
                      ),
                    ),

                    Text(
                      context.l10n.verifiedBuyer,
                      style: AppTextStyles.enSb14.copyWith(
                        color: context.isLightMode
                            ? Colors.black54
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                DateFormat("MMM d, yyyy").format(review.createdAt),
                style: AppTextStyles.enSb14.copyWith(
                  color: context.isLightMode ? Colors.black54 : Colors.white,
                ),
              ),
            ],
          ),

          16.verticalSizedBox,

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.isLightMode
                  ? Colors.black.withValues(alpha: .05)
                  : Colors.white.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DynamicRatingStars(rating: review.rating.toDouble()),
          ),

          16.verticalSizedBox,

          Text(
            review.review,
            style: AppTextStyles.normalTextStyle.copyWith(
              color: context.textColor,
            ),
          ),

          4.verticalSizedBox,
        ],
      ),
    );
  }
}
