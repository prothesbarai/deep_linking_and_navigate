# deep_linking_and_navigate

Deep Linking Application

## Getting Started

# Deep Linking Guide
#### Deep linking এর মাধ্যমে ব্যবহারকারী সরাসরি কোনো URL বা লিঙ্ক থেকে অ্যাপের নির্দিষ্ট পেজে পৌঁছাতে পারে। এটি চ্যাট অ্যাপে খুবই গুরুত্বপূর্ণ, যেমন: নির্দিষ্ট চ্যাট রুমে সরাসরি যাওয়া।
# 🎯 Deep Linking Rule মনে রাখো
- Scenario	>>>>>>     কে control করে?
- App installed	>>     Android OS
- App not installed	>> Browser
- Dart code	>>>        Only when app is installed

## Install Packages
```yaml
  # Deep Link Purpose
  app_links: ^6.4.1
  url_launcher: ^6.3.2
```

## Dart Code Helper Function (deep_link_handler Folder two files)
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


/// >>> Open the app page if installed =========================================
void handleLink(Uri uri) async{
  debugPrint("Deep link: $uri");

  // Supported domains / schemes
  List<String> supportedDomains = ["prothesbarai.github.io", "prothesbarai.github", "https://prothesbarai.io"];
  bool domainSupported = supportedDomains.any((d) => uri.host.endsWith(d));

  if (!domainSupported) {
    // >>> Unsupported domain, fallback behavior
    debugPrint("Unsupported domain: redirecting to homepage or Play Store");
    NavigationService.push(HomePage());
    return;
  }

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
/// <<< Open the app page if installed =========================================
```

## Now main.dart Call
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


# 🟢 ANDROID (Kotlin Setup)
- Setup For Android :
- - নেভিগেট করুন android/app/src/main/AndroidManifest.xml
- - - <activity>ট্যাগের ভিতরে নিম্নলিখিত মেটাডেটা ট্যাগ এবং ইনটেন্ট ফিল্টার যোগ করুন
```xml
    <!--Deep Linking Purpose Add -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="https" android:host="prothesbarai.github.io" android:pathPrefix="/" />
    </intent-filter>
```
- - - Note : android:host="example.com"  Here Your Domain Name >> Ex : prothesbarai.github.io

## Final Server Setup code
- assetlinks.json (Server এ দিতে হবে)
```dtd
 https://yourdomain.com/.well-known/assetlinks.json
```
- Example:
```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.your.app",
      "sha256_cert_fingerprints": ["YOUR_SHA256"]
    }
  }
]
```


# 🍎 iOS (Swift Setup)
-  Runner → Signing & Capabilities
- Add:
```dtd
    Associated Domains
```
- Add:
```dtd
    applinks:yourdomain.com
```
- Server এ দিতে হবে
```dtd
    https://yourdomain.com/.well-known/apple-app-site-association
```
- Example:
```json
{
  "applinks": {
    "details": [
      {
        "appID": "TEAMID.com.your.app",
        "paths": ["*"]
      }
    ]
  }
}
```




# If Not Install App Then >>>
- একটা redirect page বানাও
- Example: https://prothesbarai.github.io/product/10 এই URL এ যদি app install না থাকে → Browser খুলবে
- Browser page এ এই JavaScript রাখো:
```html
    <script>
      setTimeout(function() {window.location.href = "https://play.google.com/store/apps/details?id=com.your.package";}, 1500);
    </script>
```

### Flow হবে:
- App installed → OS সরাসরি app open
- App not installed → Browser open
- 1.5 sec পরে → Play Store redirect

- Browser page এ JavaScript এটা index.html file দিয়ে রাখতে হয় তবে auto redirect করবে কিন্তু [ যদি github হয় তাহলে Step - 1 & Then Step - 2 ] >>> [  Other wise Only Step - 2  ]
- Step 1 :
- Create 404.html in root
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Redirecting...</title>
  <script>
    // All unknown routes fallback to index.html
    window.location.replace("/fallback_screen_android_apps/falback.html");
  </script>
</head>
<body>
  <p>Redirecting to app...</p>
</body>
</html>
```
- Step -2
- Create fallback_screen_android_apps Folder and in folder create a falback.html file
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Opening App...</title>

  <script>
    var storeUrl = "https://play.google.com/store/apps/details?id=com.deep_linking_and_navigate";

    // Wait 1.5 sec then redirect to Play Store
    setTimeout(function () { window.location.href = storeUrl;}, 1500);
  </script>
</head>

<body style="text-align:center; font-family: Arial; margin-top:100px;">
  <h2>Opening App...</h2>
  <p>If the app is not installed, redirecting to Play Store...</p>

  <p>
    <a href="https://play.google.com/store/apps/details?id=com.deep_linking_and_navigate">
      Click here if not redirected
    </a>
  </p>
</body>
</html>
```



# SHA key Find Command
```dtd
    keytool -list -v -keystore "C:\Users\Prothes\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```



