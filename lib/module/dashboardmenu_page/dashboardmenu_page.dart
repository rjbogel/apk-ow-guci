import 'package:apk_ow_guci/module/dashboarddata_page/datahotel_page.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/datamakanan_page.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/datawisata_page.dart';
import 'package:apk_ow_guci/module/food_page/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apk_ow_guci/module/dashboardmenu_page/dashboardmenu_notifier.dart';
import 'package:apk_ow_guci/module/dashboardmenu_page/dashboardmenu_widget.dart';
import 'package:apk_ow_guci/module/dashboard_page/dashboard_page.dart';
import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';

class DashboardmenuPage extends StatelessWidget {
  final MenuNotifier mainNotifier;
  const DashboardmenuPage({Key? key, required this.mainNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardmenuNotifier(context, mainNotifier),
      child: Consumer<DashboardmenuNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            key: value.keyScaffold,
            drawer: SizedBox(
                height: double.infinity,
                width: 200,
                child: DrawerQ(value: value)),
            body: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: AppbarQ(value: value),
                ),
                Expanded(
                  child: value.menu == 0
                      ? DashboardPage()
                      : value.menu == 1
                          ? DataWisataPage()
                          : value.menu == 2
                              ? DataMakananPage()
                              : value.menu == 3
                                  ? DataHotelPage()
                                  : SizedBox(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
