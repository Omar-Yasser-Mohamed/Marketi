import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/widgets/change_pass_widgets/change_pass_screen_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangePassScreenBody(),
    );
  }
}
