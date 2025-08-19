import 'package:deep_linking_and_navigate/pages/home_page/home_page.dart';
import 'package:deep_linking_and_navigate/pages/other_pages/dash_board.dart';
import 'package:flutter/material.dart';
import '../pages/other_pages/message_page.dart';

class CustomBottombar extends StatelessWidget {
  const CustomBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff40c2e2),
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:<Widget>[
          _buildBottomNavItem(context, Icons.category_outlined, "Category", HomePage()),
          _buildBottomNavItem(context, Icons.card_membership, "Member", HomePage()),
           SizedBox(width: 30,),
          _buildBottomNavItem(context, Icons.message, "Message", MessagePage()),
          _buildBottomNavItem(context, Icons.account_circle, "Account", DashBoard()),
        ],
      ),
    );
  }
  
  
  Widget _buildBottomNavItem(BuildContext context,IconData icon,String text,Widget pageDestination){
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => pageDestination,));},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8,),
          Icon(icon,color: Colors.white,size: 20,),
          SizedBox(height: 2,),
          Text(text,style: TextStyle(color: Colors.white,fontSize: 12),),
        ],
      ),
    );
  }
  
}
