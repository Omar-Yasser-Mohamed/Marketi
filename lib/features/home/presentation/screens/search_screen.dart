import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_details_app_bar.dart';
import 'package:marketi/features/home/presentation/widgets/search_widgets/search_bloc_builder_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        automaticallyImplyLeading: false,
        title: CustomTextFormField(
          onChanged: (query) {
            context.read<SearchCubit>().searchProducts(query);
          },
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: context.isLightMode
                  ? AppColors.lightBlue700
                  : Colors.grey.shade500,
              width: 2,
            ),
          ),
          prefixIcon: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: context.textColor,
              size: 20,
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(13.0),
            child: ShoppingCartSection(),
          ),
          hintText: context.l10n.searchHint,
        ),
      ),
      body: const SearchBlocBuilderStates(),
    );
  }
}
