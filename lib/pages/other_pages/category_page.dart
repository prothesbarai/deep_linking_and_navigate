import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(),
    );
  }
}
