import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/snake_bar_extention.dart';
import 'package:marketi/core/extentions/validation_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/helpers/app_validators.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        // Form Section
        Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  context.l10n.your_name,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: nameController,
                  hintText: context.l10n.full_name,
                  keyboardType: TextInputType.name,
                  validator: context.l10nValidator(AppValidators.name),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: context.textColor,
                  ),
                ),

                const SizedBox(height: 4),

                // phone number
                Text(
                  context.l10n.phone_number,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: phoneController,
                  hintText: context.l10n.phone_number,
                  keyboardType: TextInputType.phone,
                  validator: context.l10nValidator(AppValidators.phone),
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: context.textColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Email
                Text(
                  context.l10n.email,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: emailController,
                  hintText: context.l10n.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: context.l10nValidator(AppValidators.email),
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: context.textColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Password
                Text(
                  context.l10n.password,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: context.l10n.password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: context.l10nMultiValidator(
                    AppValidators.password,
                  ),
                  isSecure: _isPasswordHidden,
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

        const SizedBox(height: 18),

        // Sign up Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.p),
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                // Go to home screen
                context.showSuccessSnakbar(message: "Success");
              } else if (state is SignupFailure) {
                final errorMessage = FailureUiMapper.map(
                  context: context,
                  failure: state.failure,
                ).message;
                context.showErrorSnakbar(message: errorMessage);
              }
            },
            builder: (context, state) {
              return AppButton(
                isLoading: state is SignupLoading,
                text: context.l10n.signup,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignupCubit>().signup(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                      phone: phoneController.text,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
