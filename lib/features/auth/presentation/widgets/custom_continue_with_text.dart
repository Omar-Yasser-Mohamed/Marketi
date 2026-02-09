import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';

class CustomContinueWithText extends StatelessWidget {
  const CustomContinueWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20.p),
    
        const Expanded(
          child: Divider(),
        ),
    
        const SizedBox(width: 8),
    
        Text(context.l10n.or_continue_with),
    
        const SizedBox(width: 8),
    
        const Expanded(
          child: Divider(),
        ),
    
        SizedBox(width: 20.p),
      ],
    );
  }
}
