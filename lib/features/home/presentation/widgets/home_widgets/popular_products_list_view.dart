import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/widgets/product_item.dart';

class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 14.p),
      clipBehavior: Clip.none,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ProductItem(
          showAddToCartButton: false,
        );
      },
    );
  }
}
