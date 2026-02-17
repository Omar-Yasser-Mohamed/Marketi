import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/snake_bar_extention.dart';
import 'package:marketi/core/extentions/validation_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/helpers/app_validators.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:pinput/pinput.dart';

class VerificationSection extends StatefulWidget {
  const VerificationSection({super.key});

  @override
  State<VerificationSection> createState() => _VerificationSectionState();
}

class _VerificationSectionState extends State<VerificationSection> {
  late TextEditingController _otpController;

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: context.isPortrait ? 50.h : 50.w,
      height: context.isPortrait ? 50.h : 50.w,
      textStyle: AppTextStyles.enM26.copyWith(
        color: context.primaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: context.isLightMode
              ? const Color(0xffB2CCFF).withValues(alpha: .7)
              : AppColors.darkBlue700,
        ),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.red,
        width: 2,
      ),
    );

    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Pinput(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            length: 6,
            defaultPinTheme: defaultPinTheme,
            errorPinTheme: errorPinTheme,
            controller: _otpController,
            validator: context.l10nValidator(AppValidators.pin),
          ),

          const SizedBox(height: 22),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.p),
            child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
              listener: (context, state) {
                if (state is VerifyOtpFailure) {
                  final errorMsg = FailureUiMapper.map(
                    context: context,
                    failure: state.failure,
                  ).message;

                  context.showErrorSnakbar(message: errorMsg);
                } else if (state is VerifyOtpSuccess) {
                  context.push(AppRoutes.resetPassword);
                }
              },
              builder: (context, state) {
                return AppButton(
                  text: context.l10n.verify_code,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<VerifyOtpCubit>().verifyOtp(
                        resetCode: _otpController.text,
                      );
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
