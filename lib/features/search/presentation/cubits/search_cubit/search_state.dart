part of 'search_cubit.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ProductEntity> products;

  SearchSuccess(this.products);
}

final class SearchFailure extends SearchState {
  final String errorMsg;

  SearchFailure(this.errorMsg);
}
