import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/presentation/widgets/search_button.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return Text(
                context.l10n.hiUser(state.user.name),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.enM20.copyWith(
                  color: context.textColor,
                ),
              );
            }
            return const SizedBox();
          },
        ),

        14.verticalSizedBox,

        //Serach text field
        const SearchButton(),
      ],
    );
  }
}
