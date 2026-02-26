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
        appBar: AppBar( backgroundColor: Color(0xff40c2e2), centerTitle: true, title: Text("Product Page",style: TextStyle(color: Colors.white,),)),
        body: Center(child: Text("Product ID: $productId"),),
      ),
    );
  }
}
