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
        leading: const Icon(Icons.home),
        centerTitle: true,
        title: const Text("Obyek Wisata Guci"),
      ),
      body: Center(
        child: Image.asset(
          "assets/guci.jpg",
          height: 100,
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
