import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/snake_bar_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/cubits/checkout_cubit/checkout_cubit.dart';

class ConfirmOrderSection extends StatelessWidget {
  const ConfirmOrderSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = GoRouterState.of(context).extra as CartEntity;
    final checkoutCubit = context.read<CheckoutCubit>();

    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state.status == CheckoutStatus.success) {
          context.read<CartCubit>().getCart();
          context.go(AppRoutes.checkoutSuccessScreen);
        } else if (state.status == CheckoutStatus.failure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure!,
          );
          context.showErrorSnakbar(message: error.message);
        } else if (state.status == CheckoutStatus.onlinePaymentRedirecting) {
          context.push(AppRoutes.paymentWebViewScreen, extra: state.url);
        }
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state.status == CheckoutStatus.loading,
          text: context.l10n.placeOrder,
          onPressed: () {
            if (!checkoutCubit.checkValidation()) {
              context.showErrorSnakbar(
                message: context.l10n.pleaseCompleteAllFields,
              );
            } else {
              checkoutCubit.submitOrder(cart.id);
            }
          },
        );
      },
    );
  }
}
