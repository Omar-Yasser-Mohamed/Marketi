import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/logout_section.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/profile_settings_section.dart';

import '../widgets/profile_widgets/profile_data_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.p),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 56),

            const ProfileDataHeader(),

            const SizedBox(height: 20),

            Text(
              context.l10n.settings,
              style: AppTextStyles.arM16.copyWith(
                color: context.textColor,
              ),
            ),

            const SizedBox(height: 10),

            const ProfileSettingsSection(),

            const SizedBox(height: 24),

            const LogoutSection(),
          ],
        ),
      ),
    );
  }
}
