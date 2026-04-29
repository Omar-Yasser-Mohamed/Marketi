import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class EmptyFavScreen extends StatelessWidget {
  const EmptyFavScreen({super.key});

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
                  Icon(
                    Icons.bookmark_add_outlined,
                    size: 120,
                    color: context.textColor.withValues(alpha: .2),
                  ),

                  const SizedBox(height: 22),

                  Text(
                    context.l10n.favoritesEmptyTitle,
                    style: AppTextStyles.enM24.copyWith(
                      color: context.textColor,
                    ),
                  ),

                  const SizedBox(height: 28),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.p),
                    child: Text(
                      context.l10n.favoritesEmptyDescription,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.enM16.copyWith(
                        color: const Color(0xff51526C),
                      ),
                    ),
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
