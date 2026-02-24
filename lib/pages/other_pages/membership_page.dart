import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class MembershipPage extends StatelessWidget {
  final bool fromDeepLink;
  const MembershipPage({super.key, required this.fromDeepLink});

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
