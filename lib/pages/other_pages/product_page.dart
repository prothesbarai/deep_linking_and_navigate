import 'package:flutter/material.dart';
import '../../deep_link_handler/navigation_service.dart';
import '../splash_screen/splash_screen.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  final bool fromDeepLink;
  const ProductPage({super.key, required this.productId,required this.fromDeepLink});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !fromDeepLink,
      onPopInvokedWithResult: (didPop, result) {
        if (fromDeepLink && !didPop) {
          NavigationService.popAllAndPush(const SplashScreen());
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Product Page")),
        body: Center(child: Text("Product ID: $productId"),),
      ),
    );
  }
}
