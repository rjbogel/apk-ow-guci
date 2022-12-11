import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apk_ow_guci/utils/mouse_detector_item.dart';

class MenuButton extends StatelessWidget {
  final MenuNotifier value;
  final IconData icon;
  final int pindah;
  final String text;
  const MenuButton(
      {Key? key,
      required this.value,
      required this.icon,
      required this.text,
      required this.pindah})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseDetectorItem(
      onTap: () => value.gantiMenu(this.pindah),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(this.icon),
          SizedBox(height: 4),
          Text(
            this.text,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
