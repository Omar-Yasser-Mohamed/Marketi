import 'package:flutter/material.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/token/token_service.dart';
import 'package:marketi/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await getIt<TokenService>().deleteToken();
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
