import 'package:flutter/material.dart';
import 'package:apk_ow_guci/module/profile_page/profile_notifier.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apk_ow_guci/utils/mouse_detector_item.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileNotifier(context),
      child: Consumer<ProfileNotifier>(
        builder: (context, myType, child) {
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.blueGrey,
                    ),
                    height: 310,
                    width: double.infinity,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.userLarge,
                          size: 120,
                        )),
                        margin: EdgeInsets.only(top: 50),
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ],
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 234, 236, 238),
                        ),
                      ),
                      Text(
                        "Nama pengguna ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      sosialmedia()
                    ],
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class sosialmedia extends StatelessWidget {
  const sosialmedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.75),
          ),
        ],
        color: Color.fromARGB(255, 112, 157, 233),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              FaIcon(
                FontAwesomeIcons.facebookMessenger,
              ),
              Text(
                "Rudi juniyanto",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              FaIcon(
                FontAwesomeIcons.squareInstagram,
              ),
              Text(
                "Rudi juniyanto",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              FaIcon(
                FontAwesomeIcons.envelopeCircleCheck,
              ),
              Text(
                "rudi juniyanto",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
