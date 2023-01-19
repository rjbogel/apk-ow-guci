import 'dart:io';

import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_notifier.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MyDataSourceHotel extends DataTableSource {
  final DashboardDataNotifier notifier;
  final List model;
  MyDataSourceHotel({
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
                      btnOkOnPress: () {},
                    ).show();
                  },
                  child: Text('Hapus')),
            ],
          ),
<<<<<<< HEAD
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
                Text("Input gambar Wisata"),
                Container(
                  child: FaIcon(FontAwesomeIcons.image),
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
                Text("Input nama wisata"),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan nama wisata"),
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
                Text("Input Harga"),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan HTM wisata"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: () {}, child: Text("INPUT DATA"))
        ],
      ),
=======
        ),
      ],
>>>>>>> 2a96d94a01d5bd152e4400a787f44e1be4a934dd
    );
  }
}
