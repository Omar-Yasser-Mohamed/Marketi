import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/features/profile/presentation/widgets/custom_profile_button.dart';
import 'package:marketi/features/profile/presentation/widgets/custom_profile_radio_button.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_screen_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 58),
              const CustomCenterAppBar(
                title: 'My Profile',
                showArrowButton: false,
                withShadow: true,
                showCart: true,
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: const [
                    SizedBox(height: 34),

                    ProfileScreenHeader(),

                    SizedBox(height: 12),

                    CustomProfileButton(
                      icon: Icons.person_2_outlined,
                      title: "Edit Profile",
                    ),

                    CustomProfileSwitchButton(
                      icon: Icons.dark_mode_outlined,
                      title: "Dark Mode",
                    ),

                    CustomProfileButton(
                      icon: Icons.star_border_purple500,
                      title: "Rate Us",
                    ),

                    CustomProfileButton(
                      icon: Icons.login_outlined,
                      color: ColorStyles.darkRed200,
                      title: "Logout",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
