import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_widget.dart';

class DataMakananPage extends StatelessWidget {
  const DataMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardDataNotifier(context),
      child: Consumer<DashboardDataNotifier>(
        builder: (context, value, child) {
          return ListView(
            children: [],
          );
        },
      ),
    );
  }
}
