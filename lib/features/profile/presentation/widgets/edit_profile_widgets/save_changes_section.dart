import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/snake_bar_extention.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';

class SaveChangesSection extends StatelessWidget {
  const SaveChangesSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        nameController,
        emailController,
        phoneController,
      ]),
      builder: (context, child) {
        return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) async {
            if (state is UpdateProfileSuccess) {
              final profileCubit = context.read<ProfileCubit>();
              await profileCubit.getUserData(forceRefresh: true);
              profileCubit.updateUserData(
                (profileCubit.state as ProfileSuccess).user,
              );
              context.showSuccessSnakbar(
                message: context.l10n.profileUpdatedSuccessfully,
              );
            } else if (state is UpdateProfileFailure) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              );
              context.showErrorSnakbar(message: error.message);
            }
          },
          builder: (context, state) {
            late UserEntity userData;
            if (context.read<ProfileCubit>().state is ProfileSuccess) {
              userData =
                  (context.read<ProfileCubit>().state as ProfileSuccess).user;
            }

            if (context.watch<ProfileCubit>().state is! ProfileSuccess) {
              return const SizedBox.shrink();
            }

            final isDataChanged = context
                .watch<UpdateProfileCubit>()
                .isDataChanged(
                  oldData: userData,
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );
            return AppButton(
              isLoading: state is UpdateProfileLoading,
              text: context.l10n.saveChanges,
              onPressed: isDataChanged
                  ? () {
                      context.read<UpdateProfileCubit>().updateProfile(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
                    }
                  : null,
            );
          },
        );
      },
    );
  }
}
