import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProfileCubit>().getUserData();
      await context.read<CartCubit>().getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          border: Border.symmetric(
            vertical: BorderSide(
              color: const Color(0xffB2CCFF).withValues(alpha: .7),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffB2CCFF).withValues(alpha: .5),
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: context.isLightMode
              ? Colors.white
              : AppColors.primaryDark,

          type: BottomNavigationBarType.fixed,
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) {
            widget.navigationShell.goBranch(index);
          },
          unselectedItemColor: context.isLightMode
              ? const Color(0xff67687E)
              : Colors.white,
          selectedItemColor: AppColors.primary,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: context.l10n.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: context.l10n.cart,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline),
              label: context.l10n.favorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              label: context.l10n.profile,
            ),
          ],
        ),
      ),
    );
  }
}
