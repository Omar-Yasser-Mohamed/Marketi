import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/widgets/product_item.dart';

class HomeProductsListView extends StatelessWidget {
  const HomeProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 14.p),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ProductItem();
      },
    );
  }
}
