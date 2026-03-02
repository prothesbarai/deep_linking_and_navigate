import 'package:flutter/material.dart';

class NavigationService {
  // >>>> Global navigator key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // >>>> Push to a new page
  static Future<dynamic>? push(Widget page) {
    return navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => page),);
  }

  // >>>> Replace current page
  static Future<dynamic>? pushReplacement(Widget page) {
    return navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (_) => page),);
  }

  // >>>> Pop current page
  static void pop([dynamic result]) {
    navigatorKey.currentState?.pop(result);
  }

  // >>>> Pop all and go to a page
  static Future<dynamic>? popAllAndPush(Widget page) {
    return navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false,);
  }
}