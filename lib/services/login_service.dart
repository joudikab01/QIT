import 'dart:async';
import 'package:dio/dio.dart';

class LoginService {
  Dio dio = Dio();
  static Future<void> loginRequest(String email, String password) async {
    Response response = await Dio().get(
        'http://restapi.adequateshop.com/api/authaccount/login?email=${email}&password=${password}');
  }
}
