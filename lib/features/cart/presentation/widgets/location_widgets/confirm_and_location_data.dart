import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/cart/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:marketi/features/cart/domain/entities/map_location_entity.dart';
import 'package:marketi/features/cart/presentation/widgets/location_widgets/select_location_tile.dart';

class ConfirmAndLocationData extends StatelessWidget {
  const ConfirmAndLocationData({
    super.key,
    this.location,
  });

  final MapLocationEntity? location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SelectLocationTile(),

          BlocBuilder<PickLocationCubit, PickLocationState>(
            builder: (context, state) {
              if (state is PickLocationSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: AppButton(
                    onPressed: () {
                      context.pop(state.location);
                    },
                    text: context.l10n.confirmLocation,
                    height: 46,
                    radius: 16,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
