import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/search/presentation/cubits/search_cubit/search_cubit.dart';

class SearchHeaderSection extends StatefulWidget {
  const SearchHeaderSection({super.key});

  @override
  State<SearchHeaderSection> createState() => _SearchHeaderSectionState();
}

class _SearchHeaderSectionState extends State<SearchHeaderSection> {
  Timer? _debounce;

  void _search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        BlocProvider.of<SearchCubit>(context).search(query: query);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomCenterAppBar(title: ''),
        const SizedBox(height: 16),
        CustomSearchTextField(
          onChanged: _search,
        ),
      ],
    );
  }
}
