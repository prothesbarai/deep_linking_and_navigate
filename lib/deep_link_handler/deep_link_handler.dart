import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/home_page/home_page.dart';
import '../pages/other_pages/category_page.dart';
import '../pages/other_pages/membership_page.dart';
import '../pages/other_pages/product_page.dart';
import 'navigation_service.dart';

final _appLink = AppLinks();
bool _deepLinkHandled = false;

Future<bool> initDeepLink() async{
  if (_deepLinkHandled) return false;

  final uri = await _appLink.getInitialLink();
  if(uri != null){
    if (!_deepLinkHandled) {
      _deepLinkHandled = true;
      handleLink(uri);
    }
  }
  _appLink.uriLinkStream.listen((uri){
    handleLink(uri);
  });
  return false;
}

/// >>> Open the app page if installed =========================================
void handleLink(Uri uri) async{
  debugPrint("Deep link: $uri");

  // Supported domains / schemes
  List<String> supportedDomains = ["prothesbarai.github.io", "prothesbarai.github", "https://prothesbarai.io", "https://shreyasimadhu.github.io", "shreyasimadhu.github.io", "shreyasimadhu.github"];
  bool domainSupported = supportedDomains.any((d) => uri.host.endsWith(d));

  if (!domainSupported) {
    // >>> Unsupported domain, fallback behavior
    debugPrint("Unsupported domain: redirecting to homepage or Play Store");
    NavigationService.push(HomePage());
    return;
  }

  // >>> If You Want when app redirect and back press then not again open app start splash screen but back press then app restart by fromDeepLink flag
  if (uri.pathSegments.contains('product')) {
    String? id = uri.queryParameters['id'] ?? (uri.pathSegments.length > 1 ? uri.pathSegments.last : null);
    if (id != null && id.isNotEmpty) {
      NavigationService.popAllAndPush(ProductPage(productId: id,fromDeepLink: true,));
    }
  }
  else if (uri.pathSegments.contains('membership')) {
    NavigationService.popAllAndPush(MembershipPage( fromDeepLink: true,));
  }
  else if (uri.pathSegments.contains('category')) {
    String? catId = uri.queryParameters['id'] ?? (uri.pathSegments.length > 1 ? uri.pathSegments.last : null);
    if (catId != null && catId.isNotEmpty) {
      NavigationService.popAllAndPush(CategoryPage(catId: catId,fromDeepLink: true,));
    }
  }
}
/// <<< Open the app page if installed =========================================


