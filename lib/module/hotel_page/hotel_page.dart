import 'package:apk_ow_guci/module/hotel_page/hotel_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HotelNotifier(context),
      child: Consumer<HotelNotifier>(
        builder: (context, myType, child) {
          return Text("pilih hotel yang anda ingin");
        },
      ),
    );
  }
}
