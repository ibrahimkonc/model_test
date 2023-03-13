import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  User? user;

  getUser() {
    String data =
        '{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}';
    var map = json.decode(data);
    user = User.fromJson(map["data"]);

    notifyListeners();
  }
}
