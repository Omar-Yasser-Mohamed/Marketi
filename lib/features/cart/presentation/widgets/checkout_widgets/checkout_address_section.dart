import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/cart/domain/entities/map_location_entity.dart';
import 'package:marketi/features/cart/presentation/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:marketi/features/cart/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/location_widgets/view_location_on_map.dart';
import 'package:shimmer/shimmer.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.address,
          style: AppTextStyles.enSb16.copyWith(
            color: context.textColor,
          ),
        ),

        12.verticalSizedBox,

        Container(
          height: 200.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightBlue700.withValues(alpha: .7),
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              // Map
              Expanded(
                child: BlocConsumer<PickLocationCubit, PickLocationState>(
                  listener: (context, state) {
                    if (state is PickLocationSuccess) {
                      checkoutCubit.setLocation(
                        state.location.name ?? context.l10n.unknownLocation,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is PickLocationSuccess) {
                      final location = state.location;
                      return ViewLocationOnMap(
                        lat: location.lat,
                        lng: location.lng,
                      );
                    } else if (state is PickLocationLoading) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CupertinoActivityIndicator(
                              radius: 15,
                              color: AppColors.primary,
                            ),
                            8.verticalSizedBox,
                            Text(
                              context.l10n.gettingLocation,
                              style: AppTextStyles.enSb16.copyWith(
                                color: context.textColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is PickLocationFailure) {
                      final error = FailureUiMapper.map(
                        context: context,
                        failure: state.failure,
                      );
                      return Center(
                        child: Text(
                          error.message,
                          style: AppTextStyles.enSb16.copyWith(
                            color: context.textColor,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),

              // Data & Change Address
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: context.textColor,
                    ),

                    8.horizontalSizedBox,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.home,
                                style: AppTextStyles.enSb16.copyWith(
                                  color: context.textColor,
                                ),
                              ),

                              GestureDetector(
                                onTap: () async {
                                  final pickLocationState =
                                      context.read<PickLocationCubit>().state;
                                  final location = await context
                                      .push<MapLocationEntity>(
                                        AppRoutes.pickLocationScreen,
                                        extra: pickLocationState
                                                is PickLocationSuccess
                                            ? pickLocationState.location
                                            : null,
                                      );
                                  if (location != null) {
                                    checkoutCubit.setLocation(
                                      location.name ?? 'Unknown Address',
                                    );
                                    context.read<PickLocationCubit>().init(
                                      location,
                                    );
                                  }
                                },
                                child: Text(
                                  context.l10n.change,
                                  style: AppTextStyles.enSb16.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          2.verticalSizedBox,

                          BlocBuilder<PickLocationCubit, PickLocationState>(
                            builder: (context, state) {
                              if (state is PickLocationSuccess) {
                                return BlocBuilder<
                                  CheckoutCubit,
                                  CheckoutState
                                >(
                                  buildWhen: (previous, current) =>
                                      previous.location != current.location,
                                  builder: (context, checkoutState) {
                                    return Text(
                                      checkoutState.location ??
                                          context.l10n.unknownLocation,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.enM14.copyWith(
                                        color: context.textColor,
                                      ),
                                    );
                                  },
                                );
                              } else if (state is PickLocationLoading) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: 20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              } else if (state is PickLocationFailure) {
                                final error = FailureUiMapper.map(
                                  context: context,
                                  failure: state.failure,
                                );
                                return Text(
                                  error.message,
                                  style: AppTextStyles.enM14.copyWith(
                                    color: context.textColor,
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
