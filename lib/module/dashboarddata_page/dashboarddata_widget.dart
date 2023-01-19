import 'dart:io';

import 'package:apk_ow_guci/models/index.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_notifier.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
                      btnOkOnPress: () {},
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
