import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/MyWidgets/AboutCoffeHouseWidget.dart';
import 'package:coffe/MyWidgets/CoffeGroupWidget.dart';
import 'package:coffe/controllers/DishObject.dart';

import 'package:coffe/utils/Configuration/ThemeData.dart';
import 'package:coffe/utils/DataStorage/KeyStorage.dart';
import '/MyWidgets/Carousel.dart';
import '../../MyWidgets/MainCoffeViewWidget.dart';
import '/controllers/CoffeHouseObject.dart';
import '/utils/Network/RestController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int index = KeyStorage().keyStore['index'];
  final focusKey = ValueKey('focus');
  @override
  Widget build(BuildContext context) {
    KeyStorage().keyStore['index'] = index;
    // Это написал я
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<DishObject> coffes =
        Provider.of<CoffeHouse>(context, listen: true).coffes;

    List<Widget> cofWidget = [];
    List<Widget> cakeWidget = [];
    List<DishObject> coffesObj = [];
    List<DishObject> cakeObj = [];
    for (var coffe in coffes) {
      coffe.category == 'coffe' ? coffesObj.add(coffe) : cakeObj.add(coffe);
    }
    Map k = groupBy(coffesObj, (DishObject obj) => obj.subcategory);
    for (String dish in k.keys) {
      cofWidget
          .add(CoffeGroupWidget(dishes: k[dish], name: dish, key: UniqueKey()));
    }
    Map t = groupBy(cakeObj, (DishObject obj) => obj.subcategory);
    for (String dish in t.keys) {
      cakeWidget.add(CoffeGroupWidget(
        dishes: t[dish],
        name: dish,
        key: UniqueKey(),
      ));
    }

    int i = -2;
    // TODO: implement build
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          pinned:false,
          snap: false,
          floating: false,
          expandedHeight: height / 3.5,
          flexibleSpace: Stack(children: [
            Positioned(
                child: FlexibleSpaceBar(
                  title: Text(
                    Provider.of<CoffeHouse>(context, listen: true).name,
                    style: MyTheme().thefirNameStyle,
                  ),
                  background: Carousel(),
                ),
                top: 0,
                left: 0,
                right: 0,
                bottom: 0),
            Positioned(
              child: Container(
                height: 10,
                //child: Card(),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
              ),
              bottom: 0,
              right: 0,
              left: 0,
            ),
          ])),
      SliverList(
        key: focusKey,
        delegate: SliverChildListDelegate(
          [
            Align(
                alignment: Alignment.center, //or choose another Alignment
                child: SizedBox(
                    width: width - (0.01 * width),
                    child: AboutCoffeHouseWidget(
                        Provider.of<CoffeHouse>(context, listen: true)))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width / 2.2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: index == 0
                                ? MaterialStateProperty.all(Colors.grey[700])
                                : MaterialStateProperty.all(
                                    Color.fromARGB(255, 37, 37, 19))),
                        onPressed: () {
                          setState(() {
                            index = 0;
                            print(index);
                          });
                        },
                        child: Text('Напитки'))),
                SizedBox(
                    width: width / 2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: index == 1
                              ? MaterialStateProperty.all(Colors.grey[700])
                              : MaterialStateProperty.all(
                                  Color.fromARGB(255, 37, 37, 19)),
                        ),
                        onPressed: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Text('Кондитерка'))),
              ],
            ),
            index == 0
                ? Column(children: cofWidget)
                : Column(children: cakeWidget)
          ],
        ),
      )
    ]);
  }
}
