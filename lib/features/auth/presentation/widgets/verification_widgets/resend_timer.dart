import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  int totalSeconds = 1 * 10;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (totalSeconds == 0) {
          t.cancel();
        } else {
          setState(() {
            totalSeconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return Column(
      children: [
        Text(
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: AppTextStyles.enSb16.copyWith(
            color: context.isLightMode ? const Color(0xff51526C) : Colors.white,
          ),
        ),

        const SizedBox(height: 22),

        GestureDetector(
          onTap: totalSeconds != 0
              ? null
              : () {
                  setState(() {
                    totalSeconds = 1 * 10;
                    startTimer();
                  });
                },
          child: Text(
            context.l10n.resend_code,
            style: AppTextStyles.enSb16.copyWith(
              color: totalSeconds == 0
                  ? AppColors.primary
                  : const Color(0xff51526C),
            ),
          ),
        ),
      ],
    );
  }
}
