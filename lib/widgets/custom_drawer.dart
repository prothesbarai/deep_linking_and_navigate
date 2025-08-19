import 'package:deep_linking_and_navigate/pages/other_pages/profile_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff2f2f2f),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            DrawerHeader(
              decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.white,width: 1)),
              child: Row(
                  children:<Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black.withValues(alpha: 0.2),
                      child: Icon(Icons.account_circle,size: 100,color: Colors.white,)
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("Prothes Barai",style: TextStyle(color: Colors.white,fontSize: 20),overflow: TextOverflow.ellipsis,),
                          Text("01xxxxxxxxxxx",style: TextStyle(color: Colors.white,fontSize: 16),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 10,),
            _buildItems(context, Icons.home, "Home", ProfilePage()),
            _buildItems(context, Icons.account_balance, "Account", ProfilePage()),
             Divider(color: Colors.white,thickness: 1.5,),
            _buildItems(context, Icons.ac_unit, "Sharp", ProfilePage()),
            _buildItems(context, Icons.account_balance_wallet, "Balance", ProfilePage()),
          ],
        )
      ),
    );
  }




  Widget _buildItems(BuildContext context,IconData icon,String title,Widget pageDestination){
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.white),),
      leading: Icon(icon,color: Colors.white,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => pageDestination,));
      },
    );
  }


}






