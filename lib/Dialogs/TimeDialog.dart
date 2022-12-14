import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/MyWidgets/AboutCoffeHouseWidget.dart';
import 'package:coffe/MyWidgets/CoffeGroupWidget.dart';
import 'package:coffe/controllers/DishObject.dart';

import 'package:coffe/utils/Configuration/ThemeData.dart';
import 'package:coffe/utils/DataStorage/KeyStorage.dart';
import 'Notifications.dart';
import '/MyWidgets/Carousel.dart';
import '../../MyWidgets/MainCoffeViewWidget.dart';
import '/controllers/CoffeHouseObject.dart';
import '/utils/Network/RestController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

class TimeDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TimeDialogState();
  }
}

class _TimeDialogState extends State<TimeDialog> {
  @override

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.all(5),
      title: Text("Время работы кофейни",
      style: TextStyle(
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          height: height * 0.05,
          width: width * 0.6,
          child: ListView(children: [
            Text("Будни: (Пн-Пт) с 10:00 до 22:00",
      style: TextStyle(
        fontSize: 14,
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.normal,
                )),
                Text("Выходные (Сб-Вс) с 11:00 до 22:00",
      style: TextStyle(
        fontSize: 14,
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.normal,
                )),
            
          ])),
    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))));
    // TODO: implement build
  }


  }
