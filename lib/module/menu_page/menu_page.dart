import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';
import 'package:apk_ow_guci/module/menu_page/menu_widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apk_ow_guci/module/profile_page/profile_page.dart';
import 'package:apk_ow_guci/module/destination_page/destination_page.dart';
import 'package:apk_ow_guci/module/home_page/home_page.dart';
import 'package:apk_ow_guci/module/food_page/food_page.dart';
import 'package:apk_ow_guci/module/hotel_page/hotel_page.dart';
import 'package:apk_ow_guci/utils/mouse_detector_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuNotifier(context),
      child: Consumer<MenuNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            key: value.keyScaffold,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width > 600
                        ? 300
                        : double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: value.menu == 0
                                ? ProfilePage()
                                : value.menu == 1
                                    ? DestinationPage()
                                    : value.menu == 2
                                        ? HomePage()
                                        : value.menu == 3
                                            ? FoodPage()
                                            : value.menu == 4
                                                ? HotelPage()
                                                : SizedBox(),
                            color: value.menu == 0
                                ? Color.fromARGB(255, 255, 255, 255)
                                : value.menu == 1
                                    ? Colors.blue
                                    : value.menu == 2
                                        ? Colors.blueAccent
                                        : value.menu == 3
                                            ? Colors.orange
                                            : Colors.red,
                            // Color.fromARGB(255, 147, 198, 240)
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                            color: Color.fromARGB(255, 213, 214, 214),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7),
                            ),
                          ),
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MenuButton(
                                  value: value,
                                  icon: FontAwesomeIcons.userLarge,
                                  text: "Profil",
                                  pindah: 0,
                                ),
                                MenuButton(
                                  value: value,
                                  icon: FontAwesomeIcons.locationDot,
                                  text: "Wisata",
                                  pindah: 1,
                                ),
                                MenuButton(
                                  value: value,
                                  icon: FontAwesomeIcons.house,
                                  text: "Beranda",
                                  pindah: 2,
                                ),
                                MenuButton(
                                  value: value,
                                  icon: FontAwesomeIcons.bowlFood,
                                  text: "Makanan",
                                  pindah: 3,
                                ),
                                MenuButton(
                                  value: value,
                                  icon: FontAwesomeIcons.hotel,
                                  text: "Hotel",
                                  pindah: 4,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
