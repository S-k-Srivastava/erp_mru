import 'dart:async';

import 'package:erp_mru/autologin/autologin.dart';
import 'package:erp_mru/constants/injectionJs.dart';
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
      appBar: AppBar(
        title: Text(
          "Hey!",
          style: TextStyle(
            color: HexColor(accent),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          splashRadius: 20,
          iconSize: 20,
          onPressed: () {},
          icon: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/erp-red.appspot.com/o/erpred.png?alt=media&token=d8656e78-0a75-4a15-ada6-2651665fd259",
            height: 30,
            color: HexColor(accent),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              NavX(context).to(const AutoLogin(), NavXTransition.fade(), 200);
            },
            splashRadius: 18,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.settings,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
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
              builder: ((context) => Card(
                    color: HexColor(bg),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Initiating autologin...",
                            style: TextStyle(color: HexColor(accent)),
                          ),
                        ],
                      ),
                    ),
                  )),
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
