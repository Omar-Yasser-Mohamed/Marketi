import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/validation_extention.dart';
import 'package:marketi/core/helpers/app_validators.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/widgets/edit_profile_widgets/save_changes_section.dart';

class UpdateProfileSection extends StatefulWidget {
  const UpdateProfileSection({super.key});

  @override
  State<UpdateProfileSection> createState() => _UpdateProfileSectionState();
}

class _UpdateProfileSectionState extends State<UpdateProfileSection> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    final userData =
        (context.read<ProfileCubit>().state as ProfileSuccess).user;
    nameController = TextEditingController(text: userData.name);
    emailController = TextEditingController(text: userData.email);
    phoneController = TextEditingController(text: userData.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            context.l10n.full_name,
            style: AppTextStyles.enM14.copyWith(
              color: context.textColor,
            ),
          ),
        ),

        const SizedBox(height: 4),

        CustomTextFormField(
          controller: nameController,
          hintText: context.l10n.full_name,
          keyboardType: TextInputType.name,
          validator: context.l10nValidator(AppValidators.name),
          prefixIcon: Icon(
            Icons.person_outline,
            color: context.textColor,
          ),
        ),

        const SizedBox(height: 16),

        // Email
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            context.l10n.email,
            style: AppTextStyles.enM14.copyWith(
              color: context.textColor,
            ),
          ),
        ),

        const SizedBox(height: 4),

        CustomTextFormField(
          controller: emailController,
          hintText: context.l10n.email,
          keyboardType: TextInputType.emailAddress,
          validator: context.l10nValidator(AppValidators.email),
          prefixIcon: Icon(
            Icons.mail_outline,
            color: context.textColor,
          ),
        ),

        const SizedBox(height: 16),

        // phone number
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            context.l10n.phone_number,
            style: AppTextStyles.enM14.copyWith(
              color: context.textColor,
            ),
          ),
        ),

        const SizedBox(height: 4),

        CustomTextFormField(
          controller: phoneController,
          hintText: context.l10n.phone_number,
          keyboardType: TextInputType.phone,
          validator: context.l10nValidator(AppValidators.phone),
          prefixIcon: Icon(
            Icons.phone_android,
            color: context.textColor,
          ),
        ),

        const SizedBox(height: 32),

        Center(
          child: SaveChangesSection(
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
          ),
        ),
      ],
    );
  }
}
