import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/presentation/cubits/home_cubit/home_cubit.dart';

import '../widgets/home_widgets/home_screen_body.dart';
import '../widgets/home_widgets/home_shimmer_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            final allProducts = state.products;
            final bestProducts = state.bestProducts;
            final popularProducts = state.popularProducts;
            final categories = state.categories;
            final brands = state.brands;

            return HomeScreenBody(
              popularProducts: popularProducts,
              categories: categories,
              bestProducts: bestProducts,
              brands: brands,
              allProducts: allProducts,
            );
          } else if (state is HomeFailure) {
            final error = FailureUiMapper.map(
              context: context,
              failure: state.failure,
            );
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    error.image,
                    height: 350.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.p),
                    child: Text(
                      error.message,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.enSb16.copyWith(
                        color: context.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const HomeShimmerLoading();
        },
      ),
    );
  }
}
