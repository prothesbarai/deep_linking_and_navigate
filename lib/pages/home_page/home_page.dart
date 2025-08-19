import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:deep_linking_and_navigate/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Home",),
      drawer: CustomDrawer(),
    );
  }
}
