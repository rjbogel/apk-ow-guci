import 'package:apk_ow_guci/module/destination_page/destination_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DestinationNotifier(context),
      child: Consumer<DestinationNotifier>(
        builder: (context, myType, child) {
          return Text("pilih destinasi wisata");
        },
      ),
    );
  }
}
