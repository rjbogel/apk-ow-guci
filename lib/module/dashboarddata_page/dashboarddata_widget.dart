import 'dart:io';

import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_notifier.dart';
import 'package:apk_ow_guci/network/base_api.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MyDataSource extends DataTableSource {
  final DashboardDataNotifier notifier;
  final List model;
  MyDataSource({
    Key? key,
    required this.notifier,
    required this.model,
  });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => model.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(model[index].nama)),
        DataCell(Text(model[index].harga.toString())),
        DataCell(
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    notifier.destroyForm();
                    notifier.openForm(data: model[index]);
                  },
                  child: Text('Edit')),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    //
                    AwesomeDialog(
                      context: notifier.context,
                      dialogType: DialogType.question,
                      animType: AnimType.rightSlide,
                      title: 'Hapus Data',
                      desc: 'Apakah anda yakin ingin menghapus data ini?',
                      width: 500,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () => notifier.hapus(
                          endpoint: notifier.urlGambar!, id: model[index].id),
                    ).show();
                  },
                  child: Text('Hapus')),
            ],
          ),
        ),
      ],
    );
  }
}

Form formData(
    {required DashboardDataNotifier notifier,
    required BuildContext context,
    required String urlGambar,
    required String urlApi,
    String? labelGambar = "Gambar",
    String? labelNama = "Nama",
    String? labelHarga = "Harga"}) {
  return Form(
    key: notifier.formKey,
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 270,
          padding: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            color: Colors.blueAccent.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Text("Input $labelGambar"),
              SizedBox(
                height: 10,
              ),
              notifier.image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: kIsWeb
                            ? Image.network(
                                notifier.image!.path,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              )
                            : Image.file(
                                File(notifier.image!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                      ),
                    )
                  : notifier.gambar != null
                      ? Image.network(BaseApi().getFileUrl() +
                          "$urlGambar/" +
                          notifier.gambar!)
                      : FaIcon(FontAwesomeIcons.image),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  notifier.myAlert();
                },
                child: Text('Upload'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 270,
          padding: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            color: Colors.blueAccent.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Text("Input $labelNama"),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white),
                child: TextFormField(
                  controller: notifier.ctlNama,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '$labelNama tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (String? field) {
                    notifier.nama = field!;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Masukan $labelNama"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 270,
          padding: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            color: Colors.blueAccent.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Text("Input $labelHarga"),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white),
                child: TextFormField(
                  controller: notifier.ctlHarga,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '$labelHarga tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (String? field) {
                    notifier.harga = int.parse(field!);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukan $labelHarga"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (notifier.formKey.currentState!.validate()) {
                  notifier.formKey.currentState!.save();
                  notifier.save(urlApi);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data.....')),
                  );
                }
              },
              child: Text('Simpan'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () => notifier.destroyForm(),
              child: Text('Batal'),
            ),
          ],
        ),
      ],
    ),
  );
}
