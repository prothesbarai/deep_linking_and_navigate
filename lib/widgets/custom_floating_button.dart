import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final String heroTag;
  const CustomFloatingButton({super.key, this.heroTag = "custom_fab"});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Color(0xff2f2f2f),
        child: Icon(Icons.add,color: Color(0xff40c2e2),)
    );
  }
}
