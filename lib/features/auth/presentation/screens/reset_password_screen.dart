import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:marketi/features/auth/presentation/widgets/reset_password_widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.p),
            child: AuthAppBar(title: context.l10n.createNewPassword),
          ),

          const SizedBox(height: 8),

          const Expanded(
            child: ResetPasswordBody(),
          ),
        ],
      ),
    );
  }
}
