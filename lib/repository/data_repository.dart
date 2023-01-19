import 'dart:convert';

import 'package:apk_ow_guci/network/base_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DataRepository {
  static Future<dynamic> getInfografis() async {
    Dio dio = Dio();
    dio.options.baseUrl = BaseApi().getApiUrl();
    try {
      final response = await dio.get('infografis');
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['messages']['error'];
    }
  }
}
