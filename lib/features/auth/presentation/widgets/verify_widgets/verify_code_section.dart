import 'dart:async';
import 'dart:developer';

import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/utils/app_validators.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeSection extends StatefulWidget {
  const VerifyCodeSection({super.key});

  @override
  State<VerifyCodeSection> createState() => _VerifyCodeSectionState();
}

class _VerifyCodeSectionState extends State<VerifyCodeSection> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _otpController;
  late final String email;

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 60,
    textStyle: TextStyles.enM32.copyWith(
      color: ColorStyles.darkBlue900,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ColorStyles.lightBlue700),
    ),
  );

  int totalSeconds = 1 * 15; // 10 minutes = 600 seconds
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (totalSeconds == 0) {
        t.cancel(); // call the function when finished
      } else {
        setState(() {
          totalSeconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    email = context.read<VerifyOtpCubit>().email;
    _otpController = TextEditingController();

    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Pinput(
            length: 6,
            controller: _otpController,
            defaultPinTheme: defaultPinTheme,
            validator: AppValidators.pin,
          ),

          const SizedBox(height: 22),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
              listener: (context, state) {
                if (state is VerifyOtpSuccess) {
                  CherryToastMsgs.showSuccessToast(
                    context: context,
                    title: 'Success!',
                    description: 'OTP is Success',
                  );
                  GoRouter.of(
                    context,
                  ).push(Routes.changePassword, extra: email);
                } else if (state is VerifyOtpFailure) {
                  CherryToastMsgs.error(
                    context: context,
                    title: 'Error!',
                    description: state.errorMsg,
                  ).show();
                }
              },
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is VerifyOtpLoading,
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        log('OTP ---  ${_otpController.text}');
                        context.read<VerifyOtpCubit>().verifyOtp(
                          resetCode: _otpController.text,
                        );
                      }
                    },
                    text: 'Verify Code',
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 22),

          Text(
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: TextStyles.enSb16,
          ),
          const SizedBox(height: 22),

          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                CherryToastMsgs.showSuccessToast(
                  context: context,
                  title: 'Success!',
                  description: state.message,
                );
              } else if (state is ForgetPasswordFailure) {
                CherryToastMsgs.showErrorToast(
                  context,
                  'Error!',
                  state.errorMsg,
                );
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: totalSeconds != 0 || state is ForgetPasswordLoading,
                child: GestureDetector(
                  onTap: () {
                    if (totalSeconds == 0) {
                      context.read<ForgetPasswordCubit>().forgetPassword(
                        email: email,
                      );
                      totalSeconds = 15;
                      startTimer();
                    }
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyles.enSb16.copyWith(
                      color: totalSeconds == 0
                          ? ColorStyles.primary
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
