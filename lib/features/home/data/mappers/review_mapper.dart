import 'package:marketi/features/home/data/models/review_model.dart';
import 'package:marketi/features/home/domain/entities/review_entity.dart';

class ReviewMapper {
  static ReviewEntity mapToEntity(ReviewModel model) {
    return ReviewEntity(
      id: model.id,
      review: model.review,
      rating: model.rating,
      product: model.product,
      userId: model.userId,
      userName: model.userName,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static List<ReviewEntity> mapToEntityList(List<ReviewModel> models) {
    return models.map((model) => mapToEntity(model)).toList();
  }
}
