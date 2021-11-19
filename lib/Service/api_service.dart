import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final String url = 'https://reqres.in/api/users';

  Future getListUser(String page) async {
    try {
      Response response = await dio.get(url + "?page=$page");
      return response;
    } catch (e) {
      return e;
    }
  }

  Future getListDetailUser(String id) async {
    try {
      Response response = await dio.get(url + "/$id");
      return response;
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
