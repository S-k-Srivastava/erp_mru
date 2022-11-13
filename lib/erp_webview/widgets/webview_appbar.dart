import 'package:erp_mru/autologin/autologin.dart';
import 'package:erp_mru/themes/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sk_utils/sk_utils.dart';

class WebViewAppBar extends StatelessWidget {
  const WebViewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Welcome to Erp Black!",
        style: TextStyle(
          color: HexColor(accent),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        PopupMenuButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.all(10),
          splashRadius: 20,
          elevation: 30,
          color: HexColor(bg),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Autologin",
                  style: TextStyle(
                    color: HexColor(accent),
                  ),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "Themes",
                  style: TextStyle(
                    color: HexColor(accent),
                  ),
                ),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 0) {
              NavX(context).to(const AutoLogin(), NavXTransition.fade(), 200);
            } else if (value == 1) {
              NavX(context).to(const AutoLogin(), NavXTransition.fade(), 200);
            }
          },
        ),
      ],
    );
  }
}
