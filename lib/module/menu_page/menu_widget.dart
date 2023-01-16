import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apk_ow_guci/utils/mouse_detector_item.dart';

class MenuButton extends StatelessWidget {
  final MenuNotifier value;
  final IconData icon;
  final int pindah;
  final String text;
  final void Function()? action;
  const MenuButton({
    Key? key,
    required this.value,
    required this.icon,
    required this.text,
    required this.pindah,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseDetectorItem(
      onTap: action ?? () => value.gantiMenu(pindah),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: (pindah == 10 && value.menu == 10) || pindah == value.menu
                ? Colors.black
                : Colors.blueGrey,
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color:
                    (pindah == 10 && value.menu == 10) || pindah == value.menu
                        ? Colors.black
                        : Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
