import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/widgets/verify_widgets/verify_screen_body.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyScreenBody(),
    );
  }
}