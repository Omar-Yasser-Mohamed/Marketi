import 'package:flutter/material.dart';

class ProductsFromSameBrandListView extends StatelessWidget {
  const ProductsFromSameBrandListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        // return  ProductItem(
        //   product: Product,
        // );
        return Container();
      },
    );
  }
}
