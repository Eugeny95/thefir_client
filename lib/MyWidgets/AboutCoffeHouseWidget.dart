import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/controllers/CoffeHouseObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/HomePage/MapPage.dart';

class AboutCoffeHouseWidget extends StatelessWidget {
  CoffeHouse coffeHouse;
  AboutCoffeHouseWidget(this.coffeHouse) {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = height / 50;
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 60,
        child: Column(children: [
          ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                //  bottomRight: Radius.circular(15),
                // bottomLeft: Radius.circular(15))
              )),
              tileColor: Colors.grey[850],
              title: Column(children: [
                Row(children: [
                  Text(
                    'Время работы:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal),
                  ),
                ]),
                Row(children: [
                  Text(
                    ' Будни (Пн-Пт) 10:00-22:00',
                    style: TextStyle(
                        fontWeight: FontWeight.normal),
                  ),
                ]),
                Row(children: [
                  Text(
                    ' Выходные (Сб-Вс) 11:00-22:00',
                    style: TextStyle(
                        fontWeight: FontWeight.normal),
                  ),
                  
                ])
              ])),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapPage()));
              },
              child: CachedNetworkImage(
                imageUrl: 'http://185.119.58.234/place.png',
                imageBuilder: (context, imageProvider) => Container(
                  width: width - (width * 0.01),
                  height: height / 6.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
        ]));
  }
}
