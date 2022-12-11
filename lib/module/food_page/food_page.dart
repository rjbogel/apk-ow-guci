import 'package:apk_ow_guci/module/food_page/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodNotifier(context),
      child: Consumer<FoodNotifier>(
        builder: (context, myType, child) {
          return Text("pilih makanan yang anda ingin");
        },
      ),
    );
  }
}
