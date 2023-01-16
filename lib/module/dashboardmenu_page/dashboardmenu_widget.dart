import 'package:apk_ow_guci/module/dashboardmenu_page/dashboardmenu_notifier.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/images_path.dart';

class AppbarQ extends StatelessWidget {
  final DashboardmenuNotifier value;
  const AppbarQ({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: colorPrimary,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              value.keyScaffold.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerQ extends StatelessWidget {
  final DashboardmenuNotifier value;
  const DrawerQ({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                ImageAssets.logo,
                height: 30,
              ),
            ),
          ),
          getDrawerMenu(
            context: context,
            notifier: value,
            index: 0,
            title: 'Dashboard',
          ),
          getDrawerMenu(
            context: context,
            notifier: value,
            index: 1,
            title: 'Data Wisata',
          ),
          getDrawerMenu(
            context: context,
            notifier: value,
            index: 2,
            title: 'Data Makanan',
          ),
          getDrawerMenu(
            context: context,
            notifier: value,
            index: 3,
            title: 'Data Hotel',
          ),
          getDrawerMenu(
            context: context,
            notifier: value,
            index: 4,
            title: 'Logout',
            action: () => value.logout(),
          ),
        ],
      ),
    );
  }

  Container getDrawerMenu({
    required BuildContext context,
    required DashboardmenuNotifier notifier,
    int index = 99,
    String title = 'Judul Menu',
    void Function()? action,
  }) {
    return Container(
      decoration: notifier.menu == index
          ? BoxDecoration(
              color: colorPrimary.withOpacity(0.2),
              border: const Border(
                left: BorderSide(width: 8.0, color: colorPrimary),
              ),
            )
          : const BoxDecoration(),
      child: ListTile(
        title: Text(title),
        onTap: action ??
            () {
              if (notifier.menu != index) {
                notifier.gantiMenu(index);
                Navigator.pop(context);
              }
            },
      ),
    );
  }
}
