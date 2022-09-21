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
        title: const Text("Setup AutoLogin"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/erp-red.appspot.com/o/erpred.png?alt=media&token=d8656e78-0a75-4a15-ada6-2651665fd259",
                color: HexColor(accent),
                height: 100,
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: HexColor(accent)),
                  controller: useridController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                      color: HexColor(accent),
                    ),
                    helperStyle: TextStyle(color: HexColor(accent)),
                    labelStyle: TextStyle(color: HexColor(accent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    prefixIcon: Icon(
                      Icons.email,
                      color: HexColor(accent),
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
                  style: TextStyle(color: HexColor(accent)),
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                      color: HexColor(accent),
                    ),
                    helperStyle: TextStyle(color: HexColor(accent)),
                    labelStyle: TextStyle(color: HexColor(accent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    prefixIcon: Icon(
                      Icons.password,
                      color: HexColor(accent),
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
                      NavX(context)
                          .toEnd(const ErpWebView(), NavXTransition.fade(), 200);
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
