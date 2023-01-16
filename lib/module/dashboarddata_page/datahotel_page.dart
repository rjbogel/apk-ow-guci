import 'package:apk_ow_guci/module/dashboarddata_page/datahotel_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_widget.dart';

class DataHotelPage extends StatelessWidget {
  const DataHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataHotelNotifier(context),
      child: Consumer<DataHotelNotifier>(
        builder: (context, value, child) {
          return ListView(
            children: [
              FormInput(),
            ],
          );
        },
      ),
    );
  }
}
