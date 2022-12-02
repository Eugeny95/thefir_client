import 'package:coffe/MyWidgets/MainCoffeViewWidget.dart';
import 'package:coffe/controllers/DishObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeGroupWidget extends StatefulWidget {
  List<DishObject>? dishes;
  ScrollController scrollController = ScrollController();
  String name = '';
  CoffeGroupWidget({required this.dishes, required this.name, Key? key})
      : super(key: key);

  @override
  State<CoffeGroupWidget> createState() =>
      _CoffeGroupWidgetState(dishes: dishes, name: name);
}

class _CoffeGroupWidgetState extends State<CoffeGroupWidget> {
  List<DishObject>? dishes;
  String name = '';
  _CoffeGroupWidgetState({required this.dishes, required this.name, Key? key});
  List<Widget> cof = [];
  int i = -2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    i = -2;
    cof = [];
    if (dishes != null) {
      for (var dish in dishes!) {
        cof.add(DishView(dish, key: UniqueKey()));
      }
    }
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.only(top: height * 0.01)),
      
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        child:
      Container(
        width: width - (width * 0.01),
              height: height / 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 238, 238, 238),
                
              ),
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: height * 0.02)),
                      Text(
                        name,
                        style: TextStyle(
                          color: Color.fromARGB(206, 23, 23, 23),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ]),
      )),
      
      ListView.builder(
          padding: EdgeInsets.only(top: 1),
          itemCount: (cof.length / 2).ceil().toInt(),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            i = i + 2;
            if (cof.length - i == 1)
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [cof.last],
              );
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [cof[i], cof[i + 1]],
            );
          })
    ]);
  }
}
