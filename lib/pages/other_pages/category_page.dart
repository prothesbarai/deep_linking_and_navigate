import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class CategoryPage extends StatelessWidget {
  final String catId;
  final bool fromDeepLink;
  const CategoryPage ({super.key,required this.catId, required this.fromDeepLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [

        ],
      )
    );
  }
}
