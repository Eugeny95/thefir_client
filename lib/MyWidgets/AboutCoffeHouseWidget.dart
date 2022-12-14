import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/controllers/CoffeHouseObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Dialogs/TimeDialog.dart';
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
        elevation: 10,
        child: Column(children: [
          
                
          ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                //  bottomRight: Radius.circular(15),
                // bottomLeft: Radius.circular(15))
              )),
              tileColor: Color.fromARGB(58, 151, 151, 151),
              title: Column(children: [
                Row(children: [
                  //GestureDetector(
                     // child: Text("PRESS"),
                      //onTap: () async {
                       // print("object");
                     // }),
                     Text(
                    'Thefir coffe',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 46, 46),
                    fontSize: 20),
                  ),
                  
                  IconButton(
                    padding: EdgeInsets.zero,
    constraints: BoxConstraints(),
                  icon: Icon(Icons.access_time,
                  size: 15,
                  color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return TimeDialog(
                            // Provider.of<CoffeHouse>(context, listen: true)
                            //     .photos
                            );
                      },
                    );
                  }),
             
                ]),
                Row(children: [
                  Text(
                    'Воронеж, Никитинская улица, 42',
                    style: TextStyle(fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 97, 97, 97)),
                  ),
                ]),
                Padding(padding: EdgeInsets.only(top: height * 0.005)),
                Row(children: [
                GestureDetector(
                          child: Text("89304141844",
                          style: (TextStyle(color: Color.fromARGB(255, 57, 57, 57),
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),),
                          onTap: () async {
                            final url =
                                "tel://89304141844";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                              );
                            }
                          }),
                ]),
                
              ])),
            
            
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => MapPage()));
            },
            child: Container(
              width: width - (width * 0.01),
              height: height / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Color.fromARGB(58, 151, 151, 151),
              ),
              child: Column(children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: height * 0.02)),
                      Text(
                        "Оставьте отзыв о нашем заведении",
                        style: TextStyle(
                          color: Color.fromARGB(117, 51, 50, 50),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: height * 0.06)),
                      GestureDetector(
                          child: Container(
                              width: width / 2.3,
                              height: height / 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 255, 255),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/yandex.png"),
                                    fit: BoxFit.cover),
                              ),
                              child: Text("")),
                          onTap: () async {
                            final url =
                                "https://yandex.ru/maps/org/thefir_coffee/87155301425/reviews";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                              );
                            }
                          }),
                      SizedBox(
                        width: width / 30,
                      ),
                      GestureDetector(
                          child: Container(
                              width: width / 2.3,
                              height: height / 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(218, 247, 247, 247),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/2GIS.png"),
                                    fit: BoxFit.cover),
                              ),
                              child: Text("")),
                          onTap: () async {
                            final url =
                                "https://2gis.ru/voronezh/firm/70000001030259241/tab/reviews?writeReview";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                              );
                            }
                          }),
                    ]),
              ]),
            ),
          ),
        ]));
  }
}
