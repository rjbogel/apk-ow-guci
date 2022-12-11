import 'package:apk_ow_guci/module/home_page/home_page.dart';
import 'package:apk_ow_guci/module/menu_page/menu_page.dart';
import 'package:flutter/material.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final BuildContext context;

  SplashScreenNotifier(this.context) {
    pertama();
  }
  pertama() {
    Future.delayed(const Duration(seconds: 6)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MenuPage()),
          (route) => false);
    });
  }
}
