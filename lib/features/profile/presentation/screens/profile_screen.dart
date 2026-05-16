import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/profile_screen_body.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/profile_screen_shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLogoutSuccess) {
            context.go(AppRoutes.login);
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return const ProfileScreenBody();
            } else if (state is ProfileFailure) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              );
              return CustomFailureWidget(error: error);
            }

            return const ProfileScreenShimmer();
          },
        ),
      ),
    );
  }
}
