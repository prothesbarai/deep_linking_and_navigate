import 'package:deep_linking_and_navigate/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(mounted){
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  child: Icon(Icons.account_circle),
                )
              ],
            ),
          )
      ),
    );
  }
}
