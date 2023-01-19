import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/repository/data_repository.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';

class DashboardNotifier extends ChangeNotifier {
  final BuildContext context;
  bool isLoading = true;
  DashboardNotifier(this.context) {
    getData();
  }

  InfografisModel? infografis;
  List<HotelModel> listHotel = [];
  List<WisataModel> listWisata = [];
  List<MakananModel> listMakanan = [];
  Future getData() async {
    isLoading = true;
    listHotel.clear();
    listWisata.clear();
    listMakanan.clear();
    DataRepository.getInfografis().then((value) {
      infografis = InfografisModel.fromJson(value);
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
