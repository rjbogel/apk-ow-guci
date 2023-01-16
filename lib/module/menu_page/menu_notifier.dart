import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apk_ow_guci/module/login_page/login_page.dart';
import 'package:apk_ow_guci/module/dashboardmenu_page/dashboardmenu_page.dart';

class MenuNotifier extends ChangeNotifier {
  final BuildContext context;
  String? loggedIn;
  late SharedPreferences prefs;

  MenuNotifier(this.context) {
    cekLogin();
  }
  int menu = 6;
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  gantiMenu(int index) {
    menu = index;
    notifyListeners();
  }

  cekLogin() async {
    prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getString('token');
    notifyListeners();
  }
}
