import 'package:flutter/material.dart';
import 'package:marketi/features/favourites/presentation/widgets/favorites_screen_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesScreenBody(),
    );
  }
}