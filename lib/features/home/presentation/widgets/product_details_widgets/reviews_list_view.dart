import 'package:flutter/material.dart';
import 'package:marketi/features/home/domain/entities/review_entity.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/review_card.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviews});
  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewCard(review: reviews[index]);
    });
  }
}