import 'dart:convert';

import 'package:coffe/utils/Network/RestController.dart';
import 'package:coffe/utils/Security/Auth.dart';
import 'package:flutter/cupertino.dart';

class UserProfile with ChangeNotifier {
  int ids = -1;
  String name = '';
  String email = '';
  String phone = '';
  String qr = '';
  double bonuses = 0.0;

  void requestUserData() {
    RestController().sendGetRequest(
        onComplete: ({required String data, required int statusCode}) {
          fromJson(data);
          print('profile');
          notifyListeners();
        },
        onError: ({required int statusCode}) {
          notifyListeners();
        },
        controller: 'client',
        data: '',
        accessToken: Auth().accessToken);
    notifyListeners();
  }

  UserProfile() {}

  String toJson() {
    Map<String, String> data = {};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return jsonEncode(data);
  }

  fromJson(var data) {
    Map<String, dynamic> json = jsonDecode(data);
    ids = json['id'];
    name = json['firstName'];
    email = json['email'];
    bonuses = json['bonuses'];
    qr = json['id'].toString();
    phone = json['phone'];
    print('sucess');
  }
}
