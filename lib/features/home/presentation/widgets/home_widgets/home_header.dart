import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/home/presentation/cubits/home_cubit/home_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return Text(
                context.l10n.hiUser(state.user.name),
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
        CustomTextFormField(
          readOnly: true,
          hintText: context.l10n.searchHint,
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: context.textColor,
          ),
        ),
      ],
    );
  }
}
