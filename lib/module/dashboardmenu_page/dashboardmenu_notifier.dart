import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';
import 'package:apk_ow_guci/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardmenuNotifier extends ChangeNotifier {
  final BuildContext context;
  final MenuNotifier mainNotifier;
  late SharedPreferences prefs;

  DashboardmenuNotifier(this.context, this.mainNotifier);
  int menu = 0;
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  gantiMenu(int index) {
    menu = index;
    notifyListeners();
  }

  logout() async {
    // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);\
    final success = await AuthRepository.logout();
    if (success) {
      mainNotifier.cekLogin();
      mainNotifier.gantiMenu(10);
    }
  }
}
