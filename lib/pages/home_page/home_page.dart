import 'package:deep_linking_and_navigate/pages/other_pages/category_page.dart';
import 'package:deep_linking_and_navigate/pages/other_pages/dash_board.dart';
import 'package:deep_linking_and_navigate/pages/other_pages/membership_page.dart';
import 'package:deep_linking_and_navigate/pages/other_pages/message_page.dart';
import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:deep_linking_and_navigate/widgets/custom_bottom_bar.dart';
import 'package:deep_linking_and_navigate/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  List<Widget> pages = [CategoryPage(),MembershipPage(),MessagePage(), DashBoard()];
  List<String> appBarTitles = ["Category", "Membership", "Message", "Dashboard",];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(title: appBarTitles[_currentIndex]),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomBar(currentIndex: _currentIndex,onTap: (index) {setState(() {_currentIndex = index;});},),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: <Widget>[

        ],
      )
    );
  }
}
