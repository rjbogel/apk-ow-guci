import 'dart:io';

import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_notifier.dart';
import 'package:apk_ow_guci/module/dashboarddata_page/dashboarddata_widget.dart';
import 'package:apk_ow_guci/network/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataWisataPage extends StatelessWidget {
  const DataWisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DashboardDataNotifier(context),
        child: Consumer<DashboardDataNotifier>(
          builder: (context, value, child) {
            return ListView(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: value.isFormShow
                          ? Form(
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Input gambar Wisata"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        value.image != null
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: kIsWeb
                                                      ? Image.network(
                                                          value.image!.path,
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        )
                                                      : Image.file(
                                                          File(value
                                                              .image!.path),
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        ),
                                                ),
                                              )
                                            : value.gambar != null
                                                ? Image.network(
                                                    BaseApi().getFileUrl() +
                                                        "wisata/" +
                                                        value.gambar!)
                                                : FaIcon(
                                                    FontAwesomeIcons.image),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            value.myAlert();
                                          },
                                          child: Text('Upload Gambar'),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Input nama Wisata"),
                                        Container(
                                          height: 40,
                                          padding: EdgeInsets.only(left: 10),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              color: Colors.white),
                                          child: TextFormField(
                                            initialValue: value.nama,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    "Masukan nama Wisata"),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Input Tarif Wisata"),
                                        Container(
                                          height: 40,
                                          padding: EdgeInsets.only(left: 10),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              color: Colors.white),
                                          child: TextFormField(
                                            initialValue:
                                                value.harga?.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    "Masukan Tarif Wisata"),
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
                                          if (value.formKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(value.context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Processing Data.....')),
                                            );
                                          }
                                        },
                                        child: Text('Simpan'),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () => value.destroyForm(),
                                        child: Text('Batal'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
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
                        model: value.listWisata,
                      ),
                      header: const Text('List Wisata'),
                      horizontalMargin: 10,
                      rowsPerPage: 8,
                      showCheckboxColumn: false,
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
