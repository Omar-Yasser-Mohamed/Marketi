import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/shared/models/payment_method.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class PaymentMethodSheet extends StatelessWidget {
  const PaymentMethodSheet({
    super.key,
    required this.selectedPaymentMethod,
    required this.onPaymentMethodChanged,
  });
  final PaymentMethod selectedPaymentMethod;
  final Function(PaymentMethod) onPaymentMethodChanged;

  static void show({
    required BuildContext context,
    required PaymentMethod selectedPaymentMethod,
    required Function(PaymentMethod) onPaymentMethodChanged,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => PaymentMethodSheet(
        selectedPaymentMethod: selectedPaymentMethod,
        onPaymentMethodChanged: onPaymentMethodChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 52,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Text(
            context.l10n.paymentMethod,
            style: AppTextStyles.enSb16.copyWith(
              color: context.textColor,
            ),
          ),

          12.verticalSizedBox,

          PaymentMethodItem(
            svgIcon: AppIcons.cashIcon,
            title: context.l10n.cashOnDelivery,
            subTitle: context.l10n.cashOnDeliveryDescription,
            isSelected: selectedPaymentMethod is CashOnDelivery,
            onTap: () {
              onPaymentMethodChanged(const CashOnDelivery());
              context.pop();
            },
          ),

          16.verticalSizedBox,

          PaymentMethodItem(
            icon: Icons.payment,
            title: context.l10n.onlinePayment,
            subTitle: context.l10n.onlinePaymentDescription,
            isSelected: selectedPaymentMethod is OnlinePayment,
            onTap: () {
              onPaymentMethodChanged(const OnlinePayment());
              context.pop();
            },
          ),

          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 40),
        ],
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.icon,
    this.svgIcon,
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.onTap,
  });
  final IconData? icon;
  final String? svgIcon;
  final String title;
  final String subTitle;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.lightBlue700.withValues(alpha: 0.7),
              ),
            ),
            child: svgIcon == null
                ? Icon(
                    icon,
                    size: 24,
                    color: context.textColor,
                  )
                : SvgPicture.asset(
                    svgIcon!,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      context.textColor,
                      BlendMode.srcIn,
                    ),
                  ),
          ),

          12.horizontalSizedBox,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.enSb14.copyWith(
                    color: context.textColor,
                  ),
                ),

                2.verticalSizedBox,

                Text(
                  subTitle,
                  style: AppTextStyles.enM12.copyWith(color: context.textColor),
                ),
              ],
            ),
          ),

          _radioIndicator(isSelected),
        ],
      ),
    );
  }

  Widget _radioIndicator(bool isSelected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
            )
          : null,
    );
  }
}
