import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/cart/presentation/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class MobileNumberSection extends StatefulWidget {
  const MobileNumberSection({super.key});

  @override
  State<MobileNumberSection> createState() => _MobileNumberSectionState();
}

class _MobileNumberSectionState extends State<MobileNumberSection> {
  late TextEditingController mobileNumberController;

  @override
  void initState() {
    super.initState();
    final user = (context.read<ProfileCubit>().state as ProfileSuccess).user;
    mobileNumberController = TextEditingController(text: user.phone);

    context.read<CheckoutCubit>().setMobileNumber(mobileNumberController.text);
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.mobileNumber,
          style: AppTextStyles.enSb16.copyWith(color: context.textColor),
        ),

        12.verticalSizedBox,

        CustomTextFormField(
          controller: mobileNumberController,
          keyboardType: TextInputType.phone,
          prefixIcon: Icon(
            Icons.phone_android_rounded,
            color: context.textColor,
          ),
          hintText: context.l10n.mobileNumber,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: AppColors.lightBlue700.withValues(alpha: .7),
            ),
          ),
          onChanged: (value) =>
              context.read<CheckoutCubit>().setMobileNumber(value),
        ),
      ],
    );
  }
}
