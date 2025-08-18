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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/icon/deeplink.jpg"),
                ),
                SizedBox(height: 30,),
                Text("Deep Linking",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),)
              ],
            ),
          )
      ),
    );
  }
}
