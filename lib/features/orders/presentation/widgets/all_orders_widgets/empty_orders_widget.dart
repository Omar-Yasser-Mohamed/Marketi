import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/app_button.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.p, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.emptyCart,
                    height: 250.h,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    context.l10n.noOrdersTitle,
                    style: AppTextStyles.enM24.copyWith(
                      color: context.textColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.p),
                    child: Text(
                      context.l10n.noOrdersDescription,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.enM16.copyWith(
                        color: const Color(0xff51526C),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  AppButton(
                    text: context.l10n.continueShopping,
                    onPressed: () {
                      context.go(AppRoutes.homeScreen);
                    },
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
