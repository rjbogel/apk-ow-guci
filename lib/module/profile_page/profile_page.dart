import 'package:flutter/material.dart';
import 'package:apk_ow_guci/module/profile_page/profile_notifier.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 147, 149, 151),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
