import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/DishObject.dart';
import '../controllers/BasketObject.dart';

class PositionWidget extends StatefulWidget {
  DishObject coffe;
  PositionWidget({required this.coffe, Key? key}) : super(key: key);

  @override
  State<PositionWidget> createState() => _PositionWidgetState(coffe);
}

class _PositionWidgetState extends State<PositionWidget> {
  DishObject coffe;
  String suppliments = '';

  _PositionWidgetState(this.coffe) {
    for (Option item in coffe.options) {
      if (item.isSelected) {
        suppliments = suppliments + item.name + ', ';
      }
    }
    if (suppliments.length > 2) {
      suppliments = suppliments.substring(0, suppliments.length - 2);
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: coffe.picture,
                  width: width / 3,
                )),
            VerticalDivider(
              width: 1,
              color: Colors.white,
            ),
            SizedBox(
                width: width - (width / 3) - 10,
                child: Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1),
                                topRight: Radius.circular(1),
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        title: Text(
                          coffe.name,
                          
                        ),
                        tileColor: Color.fromARGB(253, 227, 226, 226),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Expanded(
                            child: Text('?????????? ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 67, 67, 67),
                                    fontWeight: FontWeight.normal)),
                            flex: 6,
                          ),
                          Expanded(
                            child: Text(
                              coffe.fieldSelection.selectedField!.name + ' ????',
                              style: TextStyle(color: Color.fromARGB(255, 67, 67, 67)),
                            ),
                            flex: 6,
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Expanded(
                            child: Text('???????????????????? ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 67, 67, 67),
                                    fontWeight: FontWeight.normal)),
                            flex: 6,
                          ),
                          Expanded(
                            child: Text(
                              coffe.count.toString() + ' ????',
                              style: TextStyle(color: Color.fromARGB(255, 67, 67, 67)),
                            ),
                            flex: 6,
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Expanded(
                            child: Text('?????????????? ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 67, 67, 67),
                                    fontWeight: FontWeight.normal)),
                            flex: 6,
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: coffe.options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return coffe.options[index].isSelected
                                      ? Text(coffe.options[index].name)
                                      :Column();
                                }),
                            flex: 6,
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        children: [
                          Expanded(
                            child: Text(' ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 67, 67, 67),
                                    fontWeight: FontWeight.bold)),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text(
                              '??????????????????: ' +
                                  coffe.totalCost.toString() +
                                  ' ??????.',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 67, 67, 67),
                                  fontWeight: FontWeight.normal),
                            ),
                            flex: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      )
                    ],
                  ),
                  Positioned(
                      top: height * 0.005,
                      right: -15,
                      child: RawMaterialButton(
                        onPressed: () {
                          Provider.of<BasketObject>(context, listen: false)
                              .removeCoffe(coffe);
                        },
                        
                        child: Icon(
                          Icons.close_sharp,
                          color: Color.fromARGB(255, 67, 67, 67),
                          size: 25.0,
                        ),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                      )),
                ]))
          ],
        ));
  }
}
