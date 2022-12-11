import 'package:flutter/material.dart';

class MenuNotifier extends ChangeNotifier {
  final BuildContext context;

  MenuNotifier(this.context);
  int menu = 0;
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  gantiMenu(int index) {
    menu = index;
    notifyListeners();
  }
}
