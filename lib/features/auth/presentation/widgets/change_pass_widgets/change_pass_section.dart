import 'dart:developer';

import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/utils/app_validators.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_password_text_form_field.dart';

class ChangePassSection extends StatefulWidget {
  const ChangePassSection({super.key});

  @override
  State<ChangePassSection> createState() => _ChangePassSectionState();
}

class _ChangePassSectionState extends State<ChangePassSection> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
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
                  hint: 'Confirm Password',
                  controller: _confirmPasswordController,
                  validator: (value) => AppValidators.confirmPassword(
                    value,
                    _passwordController.text,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                log('token ---  ${state.token}');
                GoRouter.of(context).go(Routes.congratsUpdatedPass);
              } else if (state is ResetPasswordFailure) {
                CherryToastMsgs.showErrorToast(
                  context,
                  'Error!',
                  state.errorMsg,
                );
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is ResetPasswordLoading,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ResetPasswordCubit>().resetPassword(
                        newPassword: _passwordController.text,
                      );
                    }
                  },
                  text: 'Save Password',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
