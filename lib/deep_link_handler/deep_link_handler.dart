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

/// >>>> Open the app page if installed ========================================
void handleLink(Uri uri) async{
  debugPrint("Deep link: $uri");

  // >>>> Supported domains / schemes
  List<String> supportedDomains = ["prothesbarai.github.io"];
  bool domainSupported = supportedDomains.any((d) => uri.host.endsWith(d));

  if (!domainSupported) {
    // >>>> Unsupported domain, fallback behavior
    debugPrint("Unsupported domain: redirecting to homepage or Play Store");
    NavigationService.push(HomePage());
    return;
  }

  /// >>> Extract query params safely
  final params = uri.queryParameters;
  String? type = params['type']; // ata String format
  String? id = params['id'] ?? (uri.pathSegments.isNotEmpty && int.tryParse(uri.pathSegments.last) != null ? uri.pathSegments.last : null);
  // >>> Example : ( /product/123  ->  id = "123" )  Or Param  ( ?id=456 ->  id = "456" ) But ( /product/abc ->  id = null )
  String? slug = params['slug']; // >> ata String format
  

  // >>>> If You Want when app redirect and back press then not again open app start splash screen but back press then app restart by fromDeepLink flag
  if ( uri.pathSegments.contains('product') || type == "product" ) {
    if (id != null && id.isNotEmpty) {
      Future.microtask(() {
        // NavigationService.popAllAndPush(ProductPage(productId: id,fromDeepLink: true,));
      });
    }
  }
  else if (uri.pathSegments.contains('membership') || type == "membership") {
    Future.microtask(() {
      // NavigationService.popAllAndPush(MembershipPage( fromDeepLink: true,));
    });
  }
  else if (uri.pathSegments.contains('category') || type == "category") {
    if (id != null && id.isNotEmpty) {
      // int? categoryId = int.tryParse(id);
      Future.microtask(() {
        // NavigationService.popAllAndPush(CategoryProductPage(categoryId: categoryId ?? 0, mainTitle: "", subTitle: "", fromDeepLink: true,));
      });
    }
  }
  else if (uri.pathSegments.contains('subcategory') || type == "subcategory") {
    if (id != null && id.isNotEmpty) {
      Future.microtask(() {
        // NavigationService.popAllAndPush(CategoryPage(catId: catId,fromDeepLink: true,));
      });
    }
  }
  else if (uri.pathSegments.contains('sub_subcategory') || type == "sub_subcategory") {
    if (id != null && id.isNotEmpty) {
      Future.microtask(() {
        //NavigationService.popAllAndPush(CategoryPage(id: id,fromDeepLink: true,));
      });
    }
  }
  else if (uri.pathSegments.contains('concern') || type == "concern" ) {
    if (id != null && id.isNotEmpty) {
      Future.microtask(() {
        // NavigationService.popAllAndPush(CategoryPage(id: id,fromDeepLink: true,));
      });
    }
  }
  else if (uri.pathSegments.contains('brand') || type == "brand" ) {
    if (id != null && id.isNotEmpty) {
      Future.microtask(() {
        // NavigationService.popAllAndPush(CategoryPage(id: id,fromDeepLink: true,));
      });
    }
  }
  else if (uri.pathSegments.contains('wildcard') || type == "wildcard" ) {
    if (slug != null && slug.isNotEmpty) {
      Future.microtask(() {
        // NavigationService.popAllAndPush(CategoryPage(id: id,fromDeepLink: true,));
      });
    }
  }
}
/// <<<< Open the app page if installed ========================================
