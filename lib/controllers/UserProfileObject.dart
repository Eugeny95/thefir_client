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
  void updateProfile(){
    RestController().sendPutRequest(
        onComplete: ({required String data, required int statusCode}) {
          
        },
        onError: ({required int statusCode}) {
          notifyListeners();
        },
        controller: 'client',
        data: toJson(),
        accessToken: Auth().accessToken);
    notifyListeners();
  }
  void requestUserData() {
    
    RestController().sendGetRequest(
        onComplete: ({required String data, required int statusCode}) {
          print('profile');
          fromJson(data);
          
          notifyListeners();
        },
        onError: ({required int statusCode}) {
          print('error');
          notifyListeners();
        },
        controller: 'client',
        data: '',
        accessToken: Auth().accessToken);
    notifyListeners();
  }

  UserProfile() {
    requestUserData();
  }

  String toJson() {
    Map<String, String> data = {};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return jsonEncode(data);
  }

  fromJson(var data) {
    print('debug');
    Map<String, dynamic> json = jsonDecode(data);

    ids = json['id'];
    name = json['firstName'];
    email = json['email'];
    bonuses = json['bonuses'];
    print('bunuses $bonuses');
    qr = json['id'].toString();
    phone = json['phone'];
    print('sucess');
  }
}
