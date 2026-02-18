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
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordSection extends StatefulWidget {
  const ResetPasswordSection({super.key});

  @override
  State<ResetPasswordSection> createState() => _ResetPasswordSectionState();
}

class _ResetPasswordSectionState extends State<ResetPasswordSection> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // form fields
        Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Password
                Text(
                  context.l10n.password,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  isSecure: _isPasswordHidden,
                  controller: passwordController,
                  hintText: context.l10n.password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: context.l10nMultiValidator(
                    AppValidators.password,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: context.textColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.isLightMode
                          ? AppColors.darkBlue900
                          : AppColors.lightBlue900,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 4),

                // Confirm Password
                Text(
                  context.l10n.confirm_password,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  isSecure: _isConfirmPasswordHidden,
                  controller: confirmPasswordController,
                  hintText: context.l10n.confirm_password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: context.l10nValidator(
                    (value) => AppValidators.confirmPassword(
                      value,
                      passwordController.text,
                    ),
                  ),

                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: context.textColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.isLightMode
                          ? AppColors.darkBlue900
                          : AppColors.lightBlue900,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 22),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.p),
          child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordFailure) {
                final errorMsg = FailureUiMapper.map(
                  context: context,
                  failure: state.failure,
                ).message;

                context.showErrorSnakbar(message: errorMsg);
              } else if (state is ResetPasswordSuccess) {
                context.go(AppRoutes.congratulationsScreen);
              }
            },
            builder: (context, state) {
              return AppButton(
                isLoading: state is ResetPasswordLoading,
                text: context.l10n.savePassword,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ResetPasswordCubit>().resetPassword(
                      newPassword: passwordController.text,
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

        const SizedBox(height: 28),
      ],
    );
  }
}
