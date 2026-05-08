import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/widgets/app_button.dart';

class ConfirmOrderSection extends StatelessWidget {
  const ConfirmOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: context.l10n.placeOrder,
      onPressed: () {},
    );
  }
}
