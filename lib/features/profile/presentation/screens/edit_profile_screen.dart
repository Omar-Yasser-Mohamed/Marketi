import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import '../widgets/edit_profile_widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.textColor,
          ),
        ),
        title: Text(
          context.l10n.editProfile,
          style: AppTextStyles.enSb20.copyWith(
            color: context.textColor,
          ),
        ),
      ),
      body: const EditProfileBody(),
    );
  }
}
