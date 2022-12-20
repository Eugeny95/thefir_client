import 'dart:convert';
import 'package:coffe/controllers/BasketObject.dart';
import 'package:coffe/utils/Security/Auth.dart';
import 'package:flutter/cupertino.dart';
import '../utils/Network/RestController.dart';
import 'DishObject.dart';

class OrderObject with ChangeNotifier {
  late BasketObject basketObject;
  int idPayment = -1;
  int ids = -1;
  bool onPlace = false;
  String requiredDateTime = '';
  bool isComplete = false;
  bool isAccepted = false;
  bool isReady = false;
  double totalCost = 0.0;
  List<DishObject> unpackedCoffe = [];

  OrderObject();

  void sendOrder() {
    RestController().sendPostRequest(
        onComplete: ({required String data, required int statusCode}) {
          //getCoffes();
        },
        onError: ({required int statusCode}) {},
        controller: 'order',
        data: jsonEncode(toJson()),
        accessToken: Auth().accessToken);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    print(requiredDateTime.toString());
    data['id_payment'] = idPayment;

    data['order'] =
        basketObject.coffePositions.map((e) => jsonDecode(e.toJson())).toList();
    data['required_date_time'] = requiredDateTime;
    data['on_place'] = onPlace;
    data['total_cost'] = basketObject.total;

    return data;
  }

  OrderObject.fromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    idPayment = jsonMap['id_payment'];
    ids = jsonMap['id'];
    isReady = jsonMap['is_ready'];

    requiredDateTime = jsonMap['required_datetime'];

    onPlace = jsonMap['on_place'];
    isAccepted = jsonMap['is_accepted'];
    totalCost = jsonMap['total_cost'];

    unpackedCoffe = (jsonMap['positions'] as List)
        .map((item) => DishObject.fromJson(jsonEncode(item)))
        .toList();
    print('----------------------------------------------------');
    print('айди платежа $idPayment');
    print('требуемое время $requiredDateTime');
    print('Итоговая стоимость $totalCost');
    print('На месте $onPlace');
  }
}
