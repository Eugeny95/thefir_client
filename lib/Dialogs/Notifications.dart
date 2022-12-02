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

class PushDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PushDialogState();
  }
}

class _PushDialogState extends State<PushDialog> {
  @override

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      title: Text("Уведомления",
      style: TextStyle(
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.bold,
                )),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          height: height * 0.9,
          width: width * 0.96,
          child: ListView(children: [
           
            
            Padding(padding:EdgeInsets.all(5)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.65,   width * 0.15 ),
      ),
                onPressed: () {
                  
                },
                child: Text('Обновить',
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 55, 55),
                  fontWeight: FontWeight.bold,
                )))
          ])),
    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))));
    // TODO: implement build
  }


  }
