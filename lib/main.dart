import 'package:deep_linking_and_navigate/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff40c2e2),
        useMaterial3: false,
        appBarTheme: AppBarTheme(backgroundColor: Color(0xfff7f7f7),),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.black),),
        drawerTheme: DrawerThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(20), left: Radius.circular(20),),),),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

