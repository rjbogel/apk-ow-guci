import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String? icon;
  final String? title;
  final int? position;
  final int? index;
  const MenuItem({Key? key, this.icon, this.title, this.position, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("$icon",
              height: 28,
              color: position == index ? Colors.red[900] : Colors.grey),
        ],
      ),
    );
  }
}
