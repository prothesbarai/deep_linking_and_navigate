import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottombar.dart';
import '../../widgets/custom_floating_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(title: "Category Page"),
      bottomNavigationBar: CustomBottombar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
