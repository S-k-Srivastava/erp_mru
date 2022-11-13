import 'dart:async';
import 'package:erp_mru/constants/injectionJs.dart';
import 'package:erp_mru/erp_webview/widgets/loading_card.dart';
import 'package:erp_mru/erp_webview/widgets/webview_appbar.dart';
import 'package:erp_mru/themes/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sk_utils/sk_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ErpWebView extends StatefulWidget {
  const ErpWebView({super.key});

  @override
  State<ErpWebView> createState() => _ErpWebViewState();
}

class _ErpWebViewState extends State<ErpWebView> {
  String? userId;
  String? pwd;
  bool isLoading = true;
  String currentUrl = "null";

  void getCreds() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    userId = sharedPrefs.getString("userid");
    pwd = sharedPrefs.getString("pwd");
  }

  @override
  void initState() {
    getCreds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController? controller;

    return Scaffold(
      backgroundColor: HexColor(bg),
      appBar: PreferredSize(
        child: WebViewAppBar(),
        preferredSize: Size.fromHeight(45),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (currentUrl.contains("index.php")) {
            return true;
          } else {
            controller!.goBack().then((value) => () {
                  controller!.runJavascript(initialInjectionJs);
                  controller!.runJavascript(homeInjectionJs);
                });
            return false;
          }
        },
        child: WebView(
          backgroundColor: HexColor(bg),
          initialUrl: "https://mrei.icloudems.com/corecampus/index.php",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) async {
            showDialog(
              context: context,
              builder: ((context) => LoadingCard()),
            );
            controller = webViewController;
            Timer(const Duration(seconds: 2), () {
              controller!.runJavascript(autoLoginjs(userId!, pwd!));
              NavX(context).back();
            });
          },
          zoomEnabled: false,
          onPageFinished: (url) async {
            currentUrl = url;
            try {
              controller!.runJavascript(initialInjectionJs);
              controller!.runJavascript(homeInjectionJs);
            } catch (_) {}
          },
        ),
      ),
    );
  }
}

//back
//themeing