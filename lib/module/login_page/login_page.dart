import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:apk_ow_guci/module/login_page/login_notifier.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apk_ow_guci/utils/mouse_detector_item.dart';
import 'package:apk_ow_guci/module/dashboard_page/dashboard_page.dart';
import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';

class LoginPage extends StatelessWidget {
  final MenuNotifier mainNotifier;
  const LoginPage({Key? key, required this.mainNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginNotifier(context, mainNotifier),
      child: Consumer<LoginNotifier>(
        builder: (context, value, child) {
          return ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.blueGrey,
                ),
                child: Form(
                  key: value.formKey,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset("assets/GUCI.png"),
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
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: FaIcon(FontAwesomeIcons.userLarge),
                                  border: InputBorder.none,
                                  hintText: "Masukan Email",
                                ),
                                validator: value.validateEmail,
                                onSaved: (newValue) => value.email = newValue,
                                initialValue: 'rudijunianto21@gmail.com',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                obscureText: value.obsPass,
                                onSaved: (newValue) =>
                                    value.password = newValue,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Tidak boleh kosong';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    icon: FaIcon(FontAwesomeIcons.lock),
                                    border: InputBorder.none,
                                    hintText: "Masukan Password",
                                    suffixIcon: IconButton(
                                        onPressed: () => value.reverseObs(),
                                        icon: Icon(value.obsPass
                                            ? Icons.visibility
                                            : Icons.visibility_off))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MouseDetectorItem(
                        onTap: () {
                          if (value.formKey.currentState!.validate()) {
                            value.formKey.currentState!.save();
                            value.login();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Processing Data......')));
                          }
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(7),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(255, 72, 61, 231),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
