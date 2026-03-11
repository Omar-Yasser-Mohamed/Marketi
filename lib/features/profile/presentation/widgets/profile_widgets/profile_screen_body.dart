import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

import 'logout_section.dart';
import 'profile_data_header.dart';
import 'profile_settings_section.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
