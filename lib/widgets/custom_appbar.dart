import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppbar({super.key,required this.title});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title,style: TextStyle(color: Colors.white),),
      backgroundColor: Color(0xff40c2e2),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.more_vert)
        )
      ],
    );
  }
}
