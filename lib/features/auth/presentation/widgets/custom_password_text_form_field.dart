import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({super.key, this.hint = 'Password'});

  final String hint;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 12,
            top: 14,
            bottom: 14,
          ),
          child: SvgPicture.asset(
            AppIcons.password,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isSecure = !isSecure;
            });
          },
          icon: Icon(
            isSecure ? Icons.visibility_off : Icons.visibility,
            color: ColorStyles.darkBlue900,
          ),
        ),
        hintText: widget.hint,
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
