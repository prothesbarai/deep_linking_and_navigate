import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBody: true,
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
