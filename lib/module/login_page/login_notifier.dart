import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';
import 'package:apk_ow_guci/repository/auth_repository.dart';
import 'package:apk_ow_guci/utils/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:apk_ow_guci/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  final BuildContext context;
  final MenuNotifier mainNotifier;
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obsPass = true;

  LoginNotifier(this.context, this.mainNotifier);

  reverseObs() {
    obsPass = !obsPass;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan alamat email yang valid'
        : (value == null || value.isEmpty ? 'Email Tidak boleh kosong' : null);
  }

  AuthModel? auth;
  Future login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthRepository.loginAttempt(email: email!, password: password!)
        .then((value) async {
      print('Berhasil');
      auth = AuthModel.fromJson(value);
      final success = await prefs.setString('token', auth?.token ?? '');
      if (success) {
        mainNotifier.cekLogin();
        mainNotifier.gantiMenu(6);
      }
    }).onError((error, stackTrace) {
      print('Gagal');
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() => notifyListeners());
  }
}
