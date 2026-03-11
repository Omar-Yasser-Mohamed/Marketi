import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class ProfileDataHeader extends StatelessWidget {
  const ProfileDataHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final user = state.user;
          return GestureDetector(
            onTap: () => context.push(AppRoutes.editProfileScreen),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: context.isLightMode
                    ? Colors.grey.shade100
                    : AppColors.customBlack2,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Text(
                      user.name.characters.first.toUpperCase(),
                      style: AppTextStyles.enM18.copyWith(color: Colors.black),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.ahlan(user.name),
                          style: AppTextStyles.enM16.copyWith(
                            color: context.textColor,
                          ),
                        ),
                        Text(
                          user.email,
                          style: AppTextStyles.normalTextStyle.copyWith(
                            color: context.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: context.textColor,
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
