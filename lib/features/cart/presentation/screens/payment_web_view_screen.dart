import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/snake_bar_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  final String url;
  const PaymentWebViewScreen({super.key, required this.url});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final url = request.url;

            // Handle success redirect (either to allorders or with success=true query param)
            if (url.contains('allorders') || url.contains('success=true')) {
              context.read<CartCubit>().getCart();
              context.go(AppRoutes.checkoutSuccessScreen);
              return NavigationDecision.prevent;
            }

            // Handle cancel/failure redirect (either to cart or with success=false query param)
            if (url.contains('cart') || url.contains('success=false')) {
              context.pop();
              context.showErrorSnakbar(
                message: context.l10n.paymentFailed,
              );
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.completePayment,
          style: AppTextStyles.enSb20,
        ),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ArrowBackButton(),
        ),
        leadingWidth: 80,
        backgroundColor: context.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
