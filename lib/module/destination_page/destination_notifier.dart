import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/repository/wisata_repository.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DestinationNotifier extends ChangeNotifier {
  final BuildContext context;
  final rupiah = NumberFormat.simpleCurrency(locale: "id_ID");
  bool isLoading = true;
  DestinationNotifier(this.context) {
    getData();
  }

  // PageController pageController = PageController(viewportFraction: 0.877);

  // double currentPage = 1;
  List<WisataModel> listWisata = [];
  Future getData() async {
    isLoading = true;
    listWisata.clear();
    WisataRepository.getWisataAll().then((value) {
      listWisata =
          value.map<WisataModel>((json) => WisataModel.fromJson(json)).toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
