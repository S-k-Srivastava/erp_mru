import 'package:erp_mru/autologin/autologin.dart';
import 'package:erp_mru/erp_webview/erp_webview.dart';
import 'package:erp_mru/themes/modes/dark.dart';
import 'package:erp_mru/themes/modes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  // WebView.platform = WebWebViewPlatform();
  var sharedPref = await SharedPreferences.getInstance();
  bool? isLoggedIn = sharedPref.getBool("isLoggedIn");
  runApp(MyApp(
    isLoggedIn: isLoggedIn != null,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Erp black',
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ? const ErpWebView() : const AutoLogin(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
