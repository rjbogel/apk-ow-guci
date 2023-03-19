import 'package:apk_ow_guci/module/hotel_page/hotel_notifier.dart';
import 'package:apk_ow_guci/network/base_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HotelNotifier(context),
      child: Consumer<HotelNotifier>(
        builder: (context, value, child) {
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/joglo.jpg",
                      fit: BoxFit.fill,
                      height: 250,
                    ),
                  ),
                  Container(
                    height: 265,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "Penginapan OW.GUCI",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: 200,
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75))
                  ],
                  color: Colors.white.withOpacity(0.75),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "   Untuk wisatawan yang mau menikmati keindahan guci lebih lama, \n banyak banget rekomendasi penginapan yang \n fasilitasnya menyesuaikan kantong\n mulai dari : \n - class bawah \n - class menengah \n - class Atas \n Baik untuk keluarga , meeting kerja , acara sekolah atau bahkan untuk pribadi    ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "  Hotel Terpopuler",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "lihat semua...  ",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  itemCount: value.listHotel.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5.0,
                                offset: Offset(0.0, 0.75),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 247, 246, 246)),
                        width: 130,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                width: 120,
                                child: Image.network(
                                  BaseApi().getFileUrl() +
                                      "hotel/" +
                                      value.listHotel[index].gambar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: 120,
                                margin: EdgeInsets.only(top: 0),
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 0.75),
                                    )
                                  ],
                                  color: Colors.white.withOpacity(0.75),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Text(
                                    value.listHotel[index].nama,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    value.rupiah
                                        .format(value.listHotel[index].harga),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
