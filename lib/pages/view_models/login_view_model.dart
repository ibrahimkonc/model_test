import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  String error = "";

  Future login() async {
    var body = {
      "email": usernameController.text,
      "password": passwordController.text
    };

    await http
        .post(Uri.parse('https://reqres.in/api/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            // body: jsonEncode(<String, String>{
            //   'email':  usernameController.text,
            //   'password':  passwordController.text,
            // }),

            body: jsonEncode(body))
        .then((response) {
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        isLogin = true;
      } else {
        error = "Email veya Şifre Hatalı..";
      }
    });

    notifyListeners();
  }
}
