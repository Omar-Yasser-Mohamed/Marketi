import 'dart:developer';

import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/utils/app_validators.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_password_text_form_field.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/forget_password_button.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomTextFormField(
              iconImage: AppIcons.email,
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: AppValidators.name,
              controller: emailController,
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomPasswordTextFormField(
              controller: passwordController,
            ),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ForgetPasswordButton(),
              SizedBox(
                width: 22,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  log('token ---- ${state.token}');
                  CherryToastMsgs.showSuccessToast(
                    context: context,
                    title: 'Success!',
                    description: 'Login Success',
                  );
                } else if (state is LoginFailure) {
                  CherryToastMsgs.showErrorToast(
                    context,
                    'Error!',
                    state.errorMsg,
                  );
                }
              },
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is LoginLoading,
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        log('email -- ${emailController.text}');
                        log('pass -- ${passwordController.text}');
                        context.read<LoginCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    text: 'Log In',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
