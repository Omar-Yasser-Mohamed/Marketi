import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    required this.hint,
    this.iconImage,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
  });
  final IconData? icon;
  final String? iconImage;
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon)
            : iconImage != null
            ? Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 12,
                  top: 14,
                  bottom: 14,
                ),
                child: SvgPicture.asset(
                  iconImage!,
                ),
              )
            : null,
        hintText: hint,
        hintStyle: TextStyles.normalTextStyle.copyWith(
          color: const Color(0xff929BAB),
        ),
        border: buildOutlineBorder(),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        color: ColorStyles.lightBlue700,
      ),
    );
  }
}
