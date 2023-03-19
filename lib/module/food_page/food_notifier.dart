import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/repository/makanan_repository.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodNotifier extends ChangeNotifier {
  final BuildContext context;
  final rupiah = NumberFormat.simpleCurrency(locale: "id_ID");
  bool isLoading = true;

  FoodNotifier(this.context) {
    getData();
  }

  List<MakananModel> listMakanan = [];
  Future getData() async {
    isLoading = true;
    listMakanan.clear();
    MakananRepository.getMakananAll().then((value) {
      listMakanan = value
          .map<MakananModel>((json) => MakananModel.fromJson(json))
          .toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
