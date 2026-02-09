import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/utils/app_validators.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';

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
                    color: context.primaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: nameController,
                  hintText: context.l10n.full_name,
                  keyboardType: TextInputType.name,
                  validator: AppValidators.name,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: context.primaryColor,
                  ),
                ),

                const SizedBox(height: 4),

                // phone number
                Text(
                  context.l10n.phone_number,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.primaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: phoneController,
                  hintText: context.l10n.phone_number,
                  keyboardType: TextInputType.phone,
                  validator: AppValidators.phone,
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: context.primaryColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Email
                Text(
                  context.l10n.email,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.primaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: emailController,
                  hintText: context.l10n.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: AppValidators.email,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: context.primaryColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Password
                Text(
                  context.l10n.password,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.primaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: context.l10n.password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: AppValidators.password,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: context.primaryColor,
                  ),
                ),

                const SizedBox(height: 4),

                // Confirm Password
                Text(
                  context.l10n.confirm_password,
                  style: AppTextStyles.enM12.copyWith(
                    color: context.primaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: context.l10n.confirm_password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    return AppValidators.confirmPassword(
                      value,
                      passwordController.text,
                    );
                  },
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: context.primaryColor,
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
          child: AppButton(
            text: context.l10n.signup,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Handle sign up logic here
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
