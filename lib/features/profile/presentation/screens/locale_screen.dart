import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/profile/presentation/cubits/locale_cubit/locale_cubit.dart';

class LocaleScreen extends StatelessWidget {
  const LocaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(context.l10n.language),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.changeLanguage,
              style: AppTextStyles.enM18.copyWith(
                color: context.textColor,
              ),
            ),
            const SizedBox(height: 16),
            RadioGroup<String>(
              groupValue: context.read<LocaleCubit>().state.languageCode,
              onChanged: (value) {
                if (value != null) {
                  context.read<LocaleCubit>().toggle();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (context.isArabic) {
                        context.read<LocaleCubit>().toggle();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: 'en',
                          fillColor: WidgetStatePropertyAll(context.textColor),
                        ),
                        Text(
                          context.l10n.english,
                          style: AppTextStyles.enR16.copyWith(
                            color: context.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (context.isEnglish) {
                        context.read<LocaleCubit>().toggle();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: 'ar',
                          fillColor: WidgetStatePropertyAll(context.textColor),
                        ),
                        Text(
                          context.l10n.arabic,
                          style: AppTextStyles.enR16.copyWith(
                            color: context.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
