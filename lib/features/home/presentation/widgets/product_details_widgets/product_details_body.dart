import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/images_section.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/prodouct_data_section.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 14),
      children: const [
        ImagesSection(),
        ProdouctDataSection(),
      ],
    );
  }
}
