import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.isSecure = false,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.initialValue,
  });

  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool isSecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecure,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      initialValue: initialValue,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: AppTextStyles.normalTextStyle,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: AppTextStyles.normalTextStyle.copyWith(
          color: context.isLightMode ? const Color(0xff929BAB) : Colors.white,
        ),
        labelStyle: AppTextStyles.normalTextStyle.copyWith(
          color: context.isLightMode ? const Color(0xff929BAB) : Colors.white,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
