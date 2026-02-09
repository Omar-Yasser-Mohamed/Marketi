import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_continue_with_text.dart';
import 'package:marketi/features/auth/presentation/widgets/google_login_button.dart';
import 'package:marketi/features/auth/presentation/widgets/signup_widgets/signup_header.dart';
import 'package:marketi/features/auth/presentation/widgets/signup_widgets/signup_section.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.p),
              child: const SignupHeader(),
            ),

            const SignupSection(),

            const SizedBox(height: 12),

            const CustomContinueWithText(),

            const SizedBox(height: 20),

            // Google Login button
            const GoogleLoginButton(),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
