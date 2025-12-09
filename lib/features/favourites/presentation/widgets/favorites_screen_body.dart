import 'package:flutter/material.dart';
import 'package:marketi/features/favourites/presentation/widgets/favorites_bloc_consumer.dart';
import 'package:marketi/features/favourites/presentation/widgets/favorites_header_section.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FavoritesHeaderSection(),

        Expanded(
          child: FavoritesBlocConsumer(),
        ),
      ],
    );
  }
}
