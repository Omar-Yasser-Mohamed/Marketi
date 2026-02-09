import 'package:flutter/material.dart';
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
  });

  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool isSecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecure,
      keyboardType: keyboardType,
      validator: validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: AppTextStyles.enR16,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: AppTextStyles.enR16.copyWith(
          color: const Color(0xff929BAB),
        ),
        labelStyle: AppTextStyles.enR16.copyWith(
          color: const Color(0xff929BAB),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
