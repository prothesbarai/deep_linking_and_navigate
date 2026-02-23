import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/home_page/home_page.dart';
import '../pages/other_pages/category_page.dart';
import '../pages/other_pages/membership_page.dart';
import '../pages/other_pages/product_page.dart';
import 'navigation_service.dart';

final _appLink = AppLinks();

void initDeepLink() async{
  final uri = await _appLink.getInitialLink();
  if(uri != null){
    handleLink(uri);
  }
  _appLink.uriLinkStream.listen((uri){
    handleLink(uri);
  });
}


/// >>> Open the app page if installed, otherwise go to Play Store =============
Future<void> openAppOrStore({required Uri appUri, required Uri storeUri}) async{
  try {
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri); // >>> app open
    } else {
      await launchUrl(storeUri, mode: LaunchMode.externalApplication); //>>> Play Store open
    }
  } catch (e) {
    await launchUrl(storeUri, mode: LaunchMode.externalApplication);
  }
}

void handleLink(Uri uri) async{
  debugPrint("Deep link: $uri");

  // Supported domains / schemes
  List<String> supportedDomains = ["prothesbarai.github.io", "prothesbarai.github", "https://prothesbarai.io"];
  bool domainSupported = supportedDomains.any((d) => uri.host.endsWith(d));

  if (!domainSupported) {
    // >>> Unsupported domain, fallback behavior
    debugPrint("Unsupported domain: redirecting to homepage or Play Store");
    NavigationService.push(HomePage()); // or Play Store
    return;
  }



  // >>> Play Store URL
  Uri storeUri = Uri.parse("https://play.google.com/store/apps/details?id=com.example.myapp");
  // >>> Android/iOS app URL scheme
  Uri appUri = uri;

  // >>> Try opening the app first
  /*if (!await canLaunchUrl(appUri)) {
    await launchUrl(storeUri, mode: LaunchMode.externalApplication);
    return;
  }*/

  // Open app or fallback
  await openAppOrStore(appUri: appUri, storeUri: storeUri);


  // >>> If the app is installed, it will navigate to a specific page
  if (uri.pathSegments.contains('product')) {
    String id = uri.pathSegments.last;
    NavigationService.push(ProductPage(productId: id));
  } else if (uri.pathSegments.contains('membership')) {
    NavigationService.push(MembershipPage());
  } else if (uri.pathSegments.contains('category')) {
    String catId = uri.pathSegments.last;
    NavigationService.push(CategoryPage(catId: catId,));
  }
}
/// <<< Open the app page if installed, otherwise go to Play Store =============


