import 'package:apk_ow_guci/module/food_page/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodNotifier(context),
      child: Consumer<FoodNotifier>(
        builder: (context, myType, child) {
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/poci.jpg",
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
                              "Makanan Khas OW.GUCI",
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
                    "   Banyak banget jajanan ataupun oleh- oleh yang bisa di jadikan buah tangan untuk keluarga \n Bukan hanya itu, namun banyak juga buah tangan lain, seperti :\n    - Souvenir\n    - Sayuran\n   - dll ",
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
                    "  Oleh-Oleh Terpopuler",
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
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
                              child: Image.asset(
                                "assets/manisan.jpg",
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
                                  "Manisan Pepaya",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rp.20.000/0.5 kg",
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
                    Container(
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
                              child: Image.asset(
                                "assets/tahu.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 120,
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 0.75))
                                ],
                                color: Colors.white.withOpacity(0.75),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(children: [
                                Text(
                                  "Tahu Aci",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rp.1000/biji",
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
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
