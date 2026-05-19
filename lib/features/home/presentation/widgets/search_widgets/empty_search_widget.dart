import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.p, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 120,
                    color: context.textColor.withValues(alpha: .2),
                  ),

                  const SizedBox(height: 22),

                  Text(
                    context.l10n.noSearchResultsTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.enM24.copyWith(
                      color: context.textColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.p),
                    child: Text(
                      context.l10n.noSearchResultsDescription,
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
