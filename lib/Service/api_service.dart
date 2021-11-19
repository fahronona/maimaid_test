import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:maimaiid_test/Model/model_user.dart';

class ApiService {
  final Dio dio = Dio();
  final String url = 'https://reqres.in/api/users';

  Future<UserModel> getListUser(String page) async {
    try {
      Response response = await dio.get(url + "?page=$page");
      return UserModel.fromJson(response.data);
    } catch (e) {
      return UserModel.withError(e.toString());
    }
  }

  Future getListDetailUser(String id) async {
    try {
      Response response = await dio.get(url + "/$id");
      return response.data;
    } catch (e) {
      return e;
    }
  }

  Future sendUser(String name, String job) async {
    try {
      Response response = await dio.post(url,
          data: {"name": name, "job": job},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      var data = response.data;
      return data;
    } catch (e) {
      return e;
    }
  }
}
