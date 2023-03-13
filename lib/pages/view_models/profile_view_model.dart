import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/user_model.dart';

import 'package:http/http.dart' as http;

class ProfileViewModel extends ChangeNotifier {
  User? user;

  Future getUser() async {
    http.Response response =
        await http.get(Uri.parse('https://reqres.in/api/users/2'));

    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      user = User.fromJson(map["data"]);
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
    // String data =
    //     '{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}';
    // var map = json.decode(data);
    // user = User.fromJson(map["data"]);
  }
}
