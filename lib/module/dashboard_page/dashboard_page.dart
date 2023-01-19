import 'package:apk_ow_guci/module/food_page/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apk_ow_guci/module/dashboard_page/dashboard_notifier.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardNotifier(context),
      child: Consumer<DashboardNotifier>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Infografis(
                  judul: "Data jumlah Wisata",
                  angka: value.infografis?.wisata.toString() ?? "0",
                  warna: Color.fromARGB(255, 64, 204, 240)),
              Infografis(
                  judul: "Data jumlah Hotel",
                  angka: value.infografis?.hotel.toString() ?? "0",
                  warna: Color.fromARGB(255, 77, 126, 233)),
              Infografis(
                  judul: "Data jumlah Makanan",
                  angka: value.infografis?.makanan.toString() ?? "0",
                  warna: Color.fromARGB(255, 29, 72, 167)),
            ],
          );
        },
      ),
    );
  }
}

class Infografis extends StatelessWidget {
  final String judul;
  final String angka;
  final Color warna;
  final double tinggi;
  const Infografis({
    super.key,
    this.judul = "judul",
    this.angka = "0",
    this.warna = Colors.blueGrey,
    this.tinggi = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: this.tinggi,
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75))
        ],
        color: this.warna.withOpacity(0.9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text(this.judul),
          Expanded(
            child: Center(
              child: Text(
                this.angka,
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
