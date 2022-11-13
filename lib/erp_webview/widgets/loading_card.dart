import 'package:erp_mru/themes/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor(AccentColors.bg),
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: SizedBox(
        width: 200,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: HexColor(AccentColors.accent),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Initiating autologin...",
              style: TextStyle(color: HexColor(AccentColors.accent)),
            ),
          ],
        ),
      ),
    );
  }
}
