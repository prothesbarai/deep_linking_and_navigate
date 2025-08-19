import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Dashboard"),
    );
  }
}
