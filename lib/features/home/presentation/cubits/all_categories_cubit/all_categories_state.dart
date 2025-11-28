part of 'all_categories_cubit.dart';

abstract class AllCategoriesState {}

final class AllCategoriesInitial extends AllCategoriesState {}

final class AllCategoriesLoading extends AllCategoriesState {}

final class AllCategoriesSuccess extends AllCategoriesState {
  final List<CategoryEntity> categories;

  AllCategoriesSuccess(this.categories);
}

final class AllCategoriesFailure extends AllCategoriesState {
  final String errorMsg;

  AllCategoriesFailure(this.errorMsg);
}
