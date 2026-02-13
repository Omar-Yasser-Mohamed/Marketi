import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/validation_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/helpers/app_validators.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';

class ForgetPassSection extends StatefulWidget {
  const ForgetPassSection({super.key});

  @override
  State<ForgetPassSection> createState() => _ForgetPassSectionState();
}

class _ForgetPassSectionState extends State<ForgetPassSection> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: Text(
              context.l10n.email,
              style: AppTextStyles.enM12.copyWith(
                color: context.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: CustomTextFormField(
              hintText: "You@gmail.com",
              keyboardType: TextInputType.emailAddress,
              validator: context.l10nValidator(AppValidators.email),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: context.primaryColor,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // send button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.p),
            child: AppButton(
              text: context.l10n.send_code,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.push(AppRoutes.verificationCode);
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
