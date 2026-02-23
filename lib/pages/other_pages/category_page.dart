import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class CategoryPage extends StatelessWidget {
  final String catId;
  const CategoryPage ({super.key,required this.catId});

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
