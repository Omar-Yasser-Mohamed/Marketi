import 'package:flutter/material.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
    super.key,
    required this.status,
    required this.color,
  });
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: AppTextStyles.enSb12.copyWith(
          color: color,
        ),
      ),
    );
  }
}
