import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(productId)
          ],
        ),
      ),
    );
  }
}
