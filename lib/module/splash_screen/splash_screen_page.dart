import 'package:apk_ow_guci/module/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: Icon(Icons.info),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),
        ],
        centerTitle: true,
        title: const Text("Obyek Wisata Guci"),
      ),
      body: Center(
        child: Image.asset(
          "assets/GUCI.png",
          height: 200,
        ),
      ),
    );
    // child: Text("Rudi juniyanto",
    //     style: TextStyle(
    //       fontStyle: FontStyle.italic,
    //       fontSize: 60,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.blue,
    //       decorationStyle: TextDecorationStyle.wavy,
    //       decorationColor: Color.fromRGBO(24, 50, 255, 1.0),
    //     ))),
  }
}
