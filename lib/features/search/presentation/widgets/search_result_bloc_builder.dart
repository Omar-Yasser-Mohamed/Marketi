import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:marketi/features/search/presentation/widgets/empty_search_result.dart';
import 'package:marketi/features/search/presentation/widgets/start_search.dart';
import 'package:marketi/features/search/presentation/widgets/virtical_products_list_view.dart';

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const StartSearch();
        } else if (state is SearchSuccess) {
          final products = state.products;
          if (products.isEmpty) {
            return const EmptySearchResult();
          }
          return VirticalProductsListView(products: products);
        } else if (state is SearchFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
