import 'package:apk_ow_guci/module/home_page/home_page.dart';
import 'package:apk_ow_guci/module/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "obyek wisata guci",
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[800],
    ),
    home: SplashScreenPage(),
  ));
}
