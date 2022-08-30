import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        centerTitle: true,
        title: const Text("Obyek Wisata Guci"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            FlutterLogo(
              size: 100,
            ),
            Text('flutter classroom beginer'),
            Text('student : Rudi Juniyanto'),
            Row(
              children: [
                Icon(Icons.home),
                Icon(Icons.headset),
                Icon(Icons.settings),
              ],
            )
          ],
        ),
      ),
    );
  }
}
