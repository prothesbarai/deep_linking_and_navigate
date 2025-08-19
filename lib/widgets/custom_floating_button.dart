import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Color(0xff2f2f2f),
        child: Icon(Icons.add,color: Color(0xff40c2e2),)
    );
  }
}
