import 'package:apk_ow_guci/module/home_page/home_page.dart';
import 'package:apk_ow_guci/module/splash_screen/splash_screen_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenNotifier(context),
      child: Consumer<SplashScreenNotifier>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width > 600
                        ? 300
                        : double.infinity,
                    child: Container(
                      color: Color.fromARGB(255, 163, 164, 165),
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/GUCI.png",
                            height: 300,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: Column(
                              children: const [
                                CircularProgressIndicator(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
