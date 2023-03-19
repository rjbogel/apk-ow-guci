import 'dart:io';

import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_notifier.dart';
import 'package:apk_ow_guci/network/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_widget.dart';

class DataMakananPage extends StatelessWidget {
  const DataMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardDataNotifier(context),
      child: Consumer<DashboardDataNotifier>(
        builder: (context, value, child) {
          value.urlGambar = "makanan";
          return ListView(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: value.isFormShow
                        ? formData(
                            context: context,
                            notifier: value,
                            urlGambar: value.urlGambar!,
                            urlApi: "makanan",
                            labelGambar: "Gambar Makanan",
                            labelNama: "Nama Makanan",
                            labelHarga: "Harga Wisata",
                          )
                        : ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () => value.openForm(),
                            child: Text('Tambah Data'),
                          ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 3),
                    ],
                  ),
                  child: PaginatedDataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Nama',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Harga',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Aksi',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    source: MyDataSource(
                      notifier: value,
                      model: value.listMakanan,
                    ),
                    header: const Text('List Makanan'),
                    horizontalMargin: 10,
                    rowsPerPage: 8,
                    showCheckboxColumn: false,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
