# deep_linking_and_navigate

Deep Linking Application

## Getting Started

# Deep Linking Guide
#### Deep linking এর মাধ্যমে ব্যবহারকারী সরাসরি কোনো URL বা লিঙ্ক থেকে অ্যাপের নির্দিষ্ট পেজে পৌঁছাতে পারে। এটি চ্যাট অ্যাপে খুবই গুরুত্বপূর্ণ, যেমন: নির্দিষ্ট চ্যাট রুমে সরাসরি যাওয়া।
- Setup For Android :
- - নেভিগেট করুন android/app/src/main/AndroidManifest.xml
- - - <activity>ট্যাগের ভিতরে নিম্নলিখিত মেটাডেটা ট্যাগ এবং ইনটেন্ট ফিল্টার যোগ করুন
```xml
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="http" android:host="example.com" />
        <data android:scheme="https" />
    </intent-filter>
```
- - - Note : android:host="example.com"  Here Your Domain Name >> Ex : prothesbarai.github.io

# Install Packages
```yaml
  # Deep Link Purpose
  app_links: ^6.4.1
  url_launcher: ^6.3.2
```

# Dart Code Helper Function (deep_link_handler Folder two files)
- navigation_service.dart
```dart
import 'package:flutter/material.dart';

class NavigationService {
  // >>> Global navigator key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // >>> Push to a new page
  static Future<dynamic>? push(Widget page) {
    return navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => page),);
  }

  // >>> Replace current page
  static Future<dynamic>? pushReplacement(Widget page) {
    return navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (_) => page),);
  }

  // >>> Pop current page
  static void pop([dynamic result]) {
    navigatorKey.currentState?.pop(result);
  }

  // >>> Pop all and go to a page
  static Future<dynamic>? popAllAndPush(Widget page) {
    return navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false,);
  }
}
```
- deep_link_handler.dart
```dart
import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
```

# Now main.dart Call
```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // >>> deep link listener & initial link call here
  initDeepLink();

  runApp(const MyApp());
}
// >>> In MaterialApp Function Write this line 
navigatorKey : NavigationService.navigatorKey,
```