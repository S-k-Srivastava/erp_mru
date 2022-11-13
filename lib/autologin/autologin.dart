import 'package:erp_mru/themes/values/colors.dart';
import 'package:erp_mru/erp_webview/erp_webview.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sk_utils/sk_utils.dart';

class AutoLogin extends StatelessWidget {
  const AutoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController useridController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Autologin"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: HexColor(AccentColors.accent),
          ),
          iconSize: 20,
          splashRadius: 20,
          onPressed: () {
            NavX(context).back();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/mru_logo.png",
                height: 80,
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: HexColor(AccentColors.accent)),
                  controller: useridController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                      color: HexColor(AccentColors.accent),
                    ),
                    helperStyle:
                        TextStyle(color: HexColor(AccentColors.accent)),
                    labelStyle: TextStyle(color: HexColor(AccentColors.accent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    prefixIcon: Icon(
                      Icons.email,
                      color: HexColor(AccentColors.accent),
                    ),
                    hintText: "e.g 22001001XXXXX",
                    labelText: "UserId",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  controller: passwordController,
                  style: TextStyle(color: HexColor(AccentColors.accent)),
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                      color: HexColor(AccentColors.accent),
                    ),
                    helperStyle:
                        TextStyle(color: HexColor(AccentColors.accent)),
                    labelStyle: TextStyle(color: HexColor(AccentColors.accent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: HexColor(AccentColors.accent))),
                    prefixIcon: Icon(
                      Icons.password,
                      color: HexColor(AccentColors.accent),
                    ),
                    hintText: "e.g *********",
                    labelText: "Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor(AccentColors.accent),
                  ),
                  onPressed: () async {
                    if (useridController.text.isEmpty) {
                      return;
                    } else if (passwordController.text.isEmpty) {
                      return;
                    } else {
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool("isLoggedIn", true);
                      sharedPref.setString(
                          "userid", useridController.text.toString().trim());
                      sharedPref.setString(
                          "pwd", passwordController.text.toString().trim());
                      NavX(context).toEnd(
                          const ErpWebView(), NavXTransition.fade(), 200);
                    }
                  },
                  child: const Text("Save Credentials"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
