import 'package:apk_ow_guci/models/hotel_model.dart';
import 'package:apk_ow_guci/repository/hotel_repository.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HotelNotifier extends ChangeNotifier {
  final BuildContext context;
  final rupiah = NumberFormat.simpleCurrency(locale: "id_ID");
  bool isLoading = true;

  HotelNotifier(this.context) {
    getData();
  }

  List<HotelModel> listHotel = [];
  Future getData() async {
    isLoading = true;
    listHotel.clear();
    HotelRepository.getHotelAll().then((value) {
      listHotel =
          value.map<HotelModel>((json) => HotelModel.fromJson(json)).toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
