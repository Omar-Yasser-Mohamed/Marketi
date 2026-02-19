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
import 'package:marketi/core/helpers/app_validators.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/forget_password_button.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _isPasswordHidden = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          // Email field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: CustomTextFormField(
              controller: _emailController,
              labelText: context.l10n.email,
              validator: context.l10nValidator(AppValidators.email),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.mail_outline,
                color: context.isLightMode
                    ? AppColors.darkBlue900
                    : AppColors.lightBlue900,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Password field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: CustomTextFormField(
              controller: _passwordController,
              isSecure: _isPasswordHidden,
              labelText: context.l10n.password,
              validator: context.l10nMultiValidator(AppValidators.password),
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: context.isLightMode
                    ? AppColors.darkBlue900
                    : AppColors.lightBlue900,
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
          ),

          const SizedBox(height: 6),

          // Forgot password
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: const ForgetPasswordButton(),
          ),

          const SizedBox(height: 20),

          // login button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.p),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  context.showSuccessSnakbar(message: "Login Success");
                  context.go(AppRoutes.homeScreen);
                } else if (state is LoginFailure) {
                  final message = FailureUiMapper.map(
                    context: context,
                    failure: state.failure,
                  ).message;
                  context.showErrorSnakbar(message: message);
                }
              },
              builder: (context, state) {
                return AppButton(
                  isLoading: state is LoginLoading,
                  text: context.l10n.login,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                        email: _emailController.text,
                        password: _passwordController.text,
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
