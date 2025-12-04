import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onTap,
    this.enabled, this.onChanged,
  });
  final void Function()? onTap;
  final bool? enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 18),
      enabled: enabled,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: 'What are you looking for ?',
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xff929BAB),
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 12,
            top: 14,
            bottom: 14,
          ),
          child: SvgPicture.asset(AppIcons.search),
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.only(
            right: 10,
            top: 8,
            bottom: 8,
          ),
          child: SvgPicture.asset(AppIcons.filter),
        ),
        border: buildOutlineBorder(),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
        disabledBorder: buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
        width: 2,
        color: ColorStyles.lightBlue700,
      ),
    );
  }
}
