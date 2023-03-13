import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/user_model.dart';

import 'package:http/http.dart' as http;

class ProfileViewModel extends ChangeNotifier {
  User? user;
  final String _baseUrl = "https://reqres.in/api/users";
  List<User> users = [];
  int perPage = 6;
  int page = 1;
  int totalPage = 1;

  Future getUser(int id) async {
    http.Response response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      user = User.fromJson(map["data"]);
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }

  Future getUsers() async {
    http.Response response =
        await http.get(Uri.parse("$_baseUrl?page=$page&per_page=$perPage"));
    var map = json.decode(response.body);
    users.clear();
    totalPage = map["total_pages"];
    for (var element in map["data"]) {
      users.add(User.fromJson(element));
    }
    notifyListeners();
  }

  Future setPage(int p) async {
    page = p;
    await getUsers();
  }
}
