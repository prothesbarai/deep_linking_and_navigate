import 'package:deep_linking_and_navigate/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

import '../../deep_link_handler/deep_link_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _startApp();
  }

  // ***** Must Important For Navigate Back-press / Back Button Control ========
  Future<void> _startApp() async {
    bool hasDeepLink = await initDeepLink();
    await Future.delayed(Duration(seconds: 3));
    if (mounted && !hasDeepLink) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()),);
    }
  }
  // ***** Must Important For Navigate Back-press / Back Button Control ========
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(radius: 80, backgroundImage: AssetImage("assets/icon/deeplink.jpg"),),
                SizedBox(height: 30,),
                Text("Deep Linking",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),)
              ],
            ),
          )
      ),
    );
  }
}
