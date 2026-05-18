import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_details_summary_section.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_items_section.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_payment_method_section.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_process_widget.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_shipping_address_section.dart';

class OrderDetailsScreenBody extends StatelessWidget {
  const OrderDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          const OrderProcessWidget(),

          20.verticalSizedBox,

          const OrderItemsSection(),

          16.verticalSizedBox,

          const OrderShippingAddressSection(),

          16.verticalSizedBox,

          const OrderPaymentMethodSection(),

          16.verticalSizedBox,

          const OrderDetailsSummarySection(),

          // 24.verticalSizedBox,

          // AppButton(
          //   text: context.l10n.downloadInvoice,
          //   onPressed: () {
          //     //TODO:: implementing downloading invoice
          //     context.showSuccessSnakbar(message: "Soon...");
          //   },
          // ),
        ],
      ),
    );
  }
}
