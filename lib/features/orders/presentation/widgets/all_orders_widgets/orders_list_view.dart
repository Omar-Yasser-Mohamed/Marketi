import 'package:flutter/material.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/presentation/widgets/all_orders_widgets/order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});
  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom,
        left: 16,
        right: 16,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}

