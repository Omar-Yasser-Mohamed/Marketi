import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/checkout_address_section.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/checkout_delivery_time_section.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/checkout_notes_section.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/confirm_order_section.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/order_summary_section.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/payment_section.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        top: 12,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8,
      ),
      child: Column(
        children: [
          // Address Section
          const CheckoutAddressSection(),

          12.verticalSizedBox,

          // Delivery Time Section
          const CheckoutDeliveryTimeSection(),

          12.verticalSizedBox,

          // Payment Section
          const PaymentSection(),

          12.verticalSizedBox,

          // Notes Section
          const CheckoutNotesSection(),

          12.verticalSizedBox,

          // Order Summary Section
          const OrderSummarySection(),

          12.verticalSizedBox,

          // Confirm Order Section
          const ConfirmOrderSection(),
        ],
      ),
    );
  }
}
