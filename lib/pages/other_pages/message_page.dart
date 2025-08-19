import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottombar.dart';
import '../../widgets/custom_floating_button.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(title: "Message Page"),
      bottomNavigationBar: CustomBottombar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          ]
        ),
      ),
    );
  }
}
