import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/orders/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:marketi/features/orders/presentation/widgets/all_orders_widgets/empty_orders_widget.dart';
import 'package:marketi/features/orders/presentation/widgets/all_orders_widgets/orders_list_view.dart';

class OrdersBlocBuilderStates extends StatelessWidget {
  const OrdersBlocBuilderStates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrdersFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return CustomFailureWidget(error: error);
        } else if (state is OrdersSuccess) {
          if (state.orders.isEmpty) {
            return const EmptyOrdersWidget();
          }
          return OrdersListView(orders: state.orders);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
