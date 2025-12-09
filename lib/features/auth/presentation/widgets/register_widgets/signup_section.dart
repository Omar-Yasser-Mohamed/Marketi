import 'dart:developer';
import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/utils/app_validators.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_password_text_form_field.dart';
import 'package:marketi/core/routes/routes.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Your Name",
                  style: TextStyles.enM14,
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  hint: 'Full Name',
                  iconImage: AppIcons.username,
                  controller: _nameController,
                  validator: AppValidators.name,
                ),
                const SizedBox(height: 4),

                const Text(
                  "Phone Number",
                  style: TextStyles.enM14,
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  hint: '+20 1123456789',
                  keyboardType: TextInputType.phone,
                  iconImage: AppIcons.phone,
                  controller: _phoneController,
                  validator: AppValidators.phone,
                ),
                const SizedBox(height: 4),

                const Text(
                  "Email",
                  style: TextStyles.enM14,
                ),
                const SizedBox(height: 2),
                CustomTextFormField(
                  hint: 'You@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  iconImage: AppIcons.email,
                  controller: _emailController,
                  validator: AppValidators.email,
                ),
                const SizedBox(height: 4),

                const Text(
                  "Password",
                  style: TextStyles.enM14,
                ),
                const SizedBox(height: 2),
                CustomPasswordTextFormField(
                  controller: _passwordController,
                ),
                const SizedBox(height: 4),

                const Text(
                  "Confirm Password",
                  style: TextStyles.enM14,
                ),
                const SizedBox(height: 2),
                CustomPasswordTextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) => AppValidators.confirmPassword(
                    value,
                    _passwordController.text.trim(),
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          const SizedBox(height: 14),
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                log('token ---  ${state.token}');
                CherryToastMsgs.showSuccessToast(
                  context: context,
                  title: 'Success!',
                  description: 'Register Success',
                );

                GoRouter.of(context).go(Routes.homeRootScreen);
              } else if (state is RegisterFailure) {
                CherryToastMsgs.showErrorToast(
                  context,
                  'Error!',
                  state.errorMsg,
                  height: 150,
                );
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is RegisterLoading,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<RegisterCubit>().register(
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        rePassword: _confirmPasswordController.text.trim(),
                        phone: _phoneController.text.trim(),
                      );
                    }
                  },
                  text: 'Sign Up',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
