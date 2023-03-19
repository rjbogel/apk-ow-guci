import 'package:apk_ow_guci/module/destination_page/destination_notifier.dart';
import 'package:apk_ow_guci/network/base_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DestinationNotifier(context),
      child: Consumer<DestinationNotifier>(
        builder: (context, value, child) {
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/gerbang.jpg",
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
                              "Informasi Terbaru OW.GUCI",
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
                    "   Untuk Masuk ke dalam tempat wisata ini, kamu hanya perlu membayar \n A. Hari biasa\n    - Rp 9.400 (Dewasa)\n    - Rp 8.500 (Anak-anak)\n B. Hari Libur\n    - Rp 11.400 (Dewasa)\n    - Rp 10.500 (Anak-anak) ",
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
                    "  Wisata Terpopuler",
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
                  itemCount: value.listWisata.length,
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
                                      "wisata/" +
                                      value.listWisata[index].gambar,
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
                                    value.listWisata[index].nama,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    value.rupiah
                                        .format(value.listWisata[index].harga),
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

// class slider extends StatelessWidget {
//   const slider({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text(
//             "Slider\nPageView",
//             style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
//           ),
//         ),
//         Container(
//           height: 200,
//           child: PageView(
//             //boucingscrollphysics() membuat efek mantul saat discroll ke samping
//             physics: BouncingScrollPhysics(),
//             controller: value.pageController,

//             //membuat pageview dapat discroll ke samping
//             scrollDirection: Axis.horizontal,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(right: 15),
//                 width: 350,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                       "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 15),
//                 width: 350,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                       "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 15),
//                 width: 350,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                       "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(25),

//           //membuat dot indicator
//           child: Row(
//             children: List.generate(
//               3,
//               (index) {
//                 return Container(
//                   margin: EdgeInsets.only(right: 5),
//                   alignment: Alignment.centerLeft,
//                   height: 9,
//                   width: 9,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: value.currentPage == index
//                         ? Colors.black
//                         : Colors.black12,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

