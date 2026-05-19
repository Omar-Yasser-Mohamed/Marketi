import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/search_widgets/empty_search_widget.dart';
import 'package:marketi/features/home/presentation/widgets/search_widgets/search_products_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/search_widgets/start_searching_widget.dart';

class SearchBlocBuilderStates extends StatelessWidget {
  const SearchBlocBuilderStates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const StartSearchingWidget();
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is SearchSuccess) {
          if (state.products.isEmpty) {
            return const EmptySearchWidget();
          }
          return SearchProductsListView(products: state.products);
        } else if (state is SearchFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return CustomFailureWidget(error: error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
