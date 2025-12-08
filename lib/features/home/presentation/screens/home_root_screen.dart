import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/screens/cart_screen.dart';
import 'package:marketi/features/home/presentation/cubits/all_products_cubit/all_product_cubit.dart';
import 'package:marketi/features/home/presentation/screens/home_screen.dart';
import 'package:marketi/features/home/presentation/widgets/home_root_widgets/custom_nav_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeRootScreen extends StatefulWidget {
  const HomeRootScreen({super.key});

  @override
  State<HomeRootScreen> createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    getIntialData();
  }

  Future<void> getIntialData() async {
    await context.read<AllProductsCubit>().getAllProducts();
    await context.read<CartCubit>().getCart();
  }

  List<Widget> _screens() {
    return [
      const HomeScreen(),
      const CartScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  final List<PersistentBottomNavBarItem> _navBarsItems = [
    customNavItem(
      icon: Icons.home_outlined,
      title: "Home",
    ),
    customNavItem(
      icon: Icons.shopping_cart_outlined,
      title: "Cart",
    ),
    customNavItem(
      icon: Icons.favorite_rounded,
      title: "Favorites",
    ),
    customNavItem(
      icon: Icons.menu,
      title: "Menu",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _screens(),
      items: _navBarsItems,
      controller: _controller,
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: NavBarDecoration(
        border: Border(
          top: BorderSide(
            color: ColorStyles.lightBlue700.withValues(alpha: .7),
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorStyles.lightBlue700.withValues(alpha: .7),
            blurRadius: 10,
          ),
        ],
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
