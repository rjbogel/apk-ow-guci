import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_widget.dart';
import 'package:apk_ow_guci/network/base_api.dart';
import 'package:apk_ow_guci/repository/data_repository.dart';
import 'package:apk_ow_guci/repository/hotel_repository.dart';
import 'package:apk_ow_guci/repository/makanan_repository.dart';
import 'package:apk_ow_guci/repository/wisata_repository.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDataNotifier extends ChangeNotifier {
  BuildContext context;
  bool isLoading = true;
  XFile? image;
  late ImagePicker picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final TextEditingController ctlNama = TextEditingController();
  final TextEditingController ctlHarga = TextEditingController();

  int? id;
  String? nama;
  int? harga;
  String? gambar;
  String? urlGambar;

  bool isFormShow = false;

  late SharedPreferences prefs;
  late String token;

  DashboardDataNotifier(this.context) {
    getData();
  }

  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    return token;
  }

  void resetData() {
    id = null;
    nama = null;
    harga = null;
    gambar = null;
    image = null;
    ctlNama.clear();
    ctlHarga.clear();
    notifyListeners();
  }

  List<HotelModel> listHotel = [];
  List<WisataModel> listWisata = [];
  List<MakananModel> listMakanan = [];
  Future getData() async {
    isLoading = true;
    listHotel.clear();
    listWisata.clear();
    listMakanan.clear();
    HotelRepository.getHotelAll().then((value) {
      listHotel =
          value.map<HotelModel>((json) => HotelModel.fromJson(json)).toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
    WisataRepository.getWisataAll().then((value) {
      listWisata =
          value.map<WisataModel>((json) => WisataModel.fromJson(json)).toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
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

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    image = img;
    notifyListeners();
  }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => DashboardDataNotifier(context),
          child: Consumer<DashboardDataNotifier>(
            builder: (context, value, child) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: Text('Please choose media to select'),
                content: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      ElevatedButton(
                        //if user click this button, user can upload image from gallery
                        onPressed: () {
                          Navigator.pop(context);
                          getImage(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.image),
                            Text('From Gallery'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        //if user click this button. user can upload image from camera
                        onPressed: () {
                          Navigator.pop(context);
                          getImage(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera),
                            Text('From Camera'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void openForm({dynamic data}) async {
    isFormShow = true;
    resetData();
    if (data != null) {
      id = data.id;
      nama = data.nama;
      harga = data.harga;
      gambar = data.gambar;
      ctlNama.text = nama!;
      ctlHarga.text = harga!.toString();
    }
    notifyListeners();
  }

  void destroyForm() {
    isFormShow = false;
    resetData();
    notifyListeners();
  }

  Future save(String endpoint) async {
    var token = await getToken();
    DataRepository.save(
      endpoint,
      token: token,
      id: id,
      nama: nama,
      harga: harga,
      gambar: image,
    ).then((value) async {
      print("Berhasil : $value");
      getData();
      CustomDialog.messageResponse(context, value['message']);
    }).onError((error, stackTrace) {
      print("Gagal : $error");
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() => notifyListeners());
  }

  Future hapus({
    required String endpoint,
    required int id,
  }) async {
    var token = await getToken();
    DataRepository.delete(endpoint, id: id, token: token).then((value) async {
      print("Berhasil : $value");
      getData();
      CustomDialog.messageResponse(context, value['message']);
    }).onError((error, stackTrace) {
      print("Gagal : $error");
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() => notifyListeners());
  }
}
