import 'package:erp_mru/autologin/autologin.dart';
import 'package:erp_mru/erp_webview/erp_webview.dart';
import 'package:erp_mru/themes/modes/dark.dart';
import 'package:erp_mru/themes/modes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
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
    return MaterialApp(
      title: 'Erp Black',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const ErpWebView() : const AutoLogin(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}