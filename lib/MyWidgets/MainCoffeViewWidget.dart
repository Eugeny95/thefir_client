import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/Dialogs/SelectDishDialog.dart';
import 'package:coffe/controllers/CoffeHouseObject.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/DishObject.dart';

class DishView extends StatefulWidget {
  DishObject coffe;
  DishView(this.coffe, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DishViewState(coffe); // TODO: implement createState
  }
}

class _DishViewState extends State<DishView> {
  late DishObject coffe;
  _DishViewState(this.coffe);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SelectDishDialog(coffe);
            },
          );
        },
        child:  Container(
            child: Stack(children: [
          Container(
            width: width / 2.15,
            height: height / 3.1,
            padding: const EdgeInsets.only(top: 4.0),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[350]),
            child: Column(children: [
              Container(
                width: width / 2.25,
                height: height / 4.5,
                padding: EdgeInsets.all(2), // Border width
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(20.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(70), // Image radius
                    child: CachedNetworkImage(
                      imageUrl: coffe.picture, fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                coffe.name,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
          ),
          Positioned(bottom: 55, left: 15, child: Text("")),
          Positioned(
            bottom: height / 65,
            left: width / 29,
            child: Container(
              width: width / 2.35,
              height: height / 18,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.circular(14.0)),
              child: Center(
                child: Text(
                  !coffe.fieldSelection.fields.isEmpty
                      ? 'от ${coffe.fieldSelection.fields[0].price.toString()} руб.'
                      : '',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ])));
  }
}
