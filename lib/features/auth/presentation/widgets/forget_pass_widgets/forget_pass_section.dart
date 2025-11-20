import 'dart:developer';

import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/utils/app_validators.dart';
import 'package:marketi/core/widgets/Custom_text_form_field.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';

class ForgetPassSection extends StatefulWidget {
  const ForgetPassSection({super.key});

  @override
  State<ForgetPassSection> createState() => _ForgetPassSectionState();
}

class _ForgetPassSectionState extends State<ForgetPassSection> {
  final _fromKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
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
              ],
            ),
          ),

          const SizedBox(height: 20),

          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                CherryToastMsgs.showSuccessToast(
                  context: context,
                  title: 'Success!',
                  description: state.message,
                );
                GoRouter.of(context).push(
                  Routes.verifyScreen,
                  extra: _emailController.text.trim(),
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
                absorbing: state is ForgetPasswordLoading,
                child: CustomButton(
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      log('email ---  ${_emailController.text}');
                      context.read<ForgetPasswordCubit>().forgetPassword(
                        email: _emailController.text,
                      );
                    }
                  },
                  text: 'Send Code',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
