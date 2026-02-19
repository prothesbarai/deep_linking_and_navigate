import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_bottom_bar.dart';
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
      appBar: CustomAppbar(title: "Message Page"),
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
