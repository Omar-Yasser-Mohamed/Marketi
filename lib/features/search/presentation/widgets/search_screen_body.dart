import 'package:flutter/material.dart';
import 'package:marketi/features/search/presentation/widgets/search_header_section.dart';
import 'package:marketi/features/search/presentation/widgets/search_result_bloc_builder.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Header Section (Search text field & App bar)
        Padding(
          padding: EdgeInsets.only(top: 57, bottom: 8),
          child: SearchHeaderSection(),
        ),

        // Result Section
        Expanded(
          child: SearchResultBlocBuilder(),
        ),
      ],
    );
  }
}
