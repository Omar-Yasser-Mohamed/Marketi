import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/snake_bar_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/auth/domain/services/email_flow.dart';
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/otp_timer_cubit.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpTimerCubit, int>(
      builder: (context, totalSeconds) {
        final int minutes = totalSeconds ~/ 60;
        final int seconds = totalSeconds % 60;
        return Column(
          children: [
            Text(
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: AppTextStyles.enSb16.copyWith(
                color: context.isLightMode
                    ? const Color(0xff51526C)
                    : Colors.white,
              ),
            ),

            const SizedBox(height: 22),

            GestureDetector(
              onTap: totalSeconds != 0
                  ? null
                  : () {
                      context.read<OtpTimerCubit>().reset();

                      resendCode(context);

                      context.showSuccessSnakbar(
                        message: context.l10n.otpResentSuccess,
                      );
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
      },
    );
  }

  void resendCode(BuildContext context) {
    final email = getIt<EmailFlow>().email;
    
    context.read<ForgetPasswordCubit>().forgetPassword(
      email: email!,
    );
  }
}
