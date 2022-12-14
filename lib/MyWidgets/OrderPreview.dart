import 'package:coffe/controllers/OrdersObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/BasketPage/OrderDetails.dart';

class OrderPreview extends StatefulWidget {
  OrderObject? orderObject;
  OrderPreview(this.orderObject, {Key? key}) : super(key: key);

  @override
  State<OrderPreview> createState() => _OrderPreviewState(orderObject);
}

class _OrderPreviewState extends State<OrderPreview> {
  OrderObject? orderObject;
  _OrderPreviewState(this.orderObject);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
         constraints: BoxConstraints(
    minHeight: height * 0.27,
        minWidth: width * 0.98,
),
        
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          elevation: 20,
          child: Column(children: [
            ListTile(
              leading: Icon(Icons.notifications),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              title: Text(
                'Заказ № ${orderObject!.ids}',
                style: TextStyle(fontSize: height * 0.028),
              ),
              tileColor: Color.fromARGB(137, 220, 220, 220),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
                width: width * 0.95,
                child: Table(

                    // textDirection: TextDirection.rtl,
                    // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                    border: TableBorder.all(width: 0.5, color: Color.fromARGB(255, 231, 231, 231)),
                    children: [
                      TableRow(children: [
                        Text(
                          "Цена",
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97)),
                          textScaleFactor: 1.1,
                        ),
                        Text("${orderObject!.totalCost} руб.",
                            textScaleFactor: 1.1),
                        // Text("University", textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text(
                          "Время готовности",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97)),
                        ),
                        Text("${orderObject!.requiredDateTime}",
                            textScaleFactor: 1.1),
                        // Text("University", textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text(
                          "Статус",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 54, 54)),
                        ),
                        orderObject!.isAccepted
                            ? Text("Заказ принят", textScaleFactor: 1.1)
                            : Text("Ожидает подтвержения", textScaleFactor: 1.1)
                        // Text("University", textScaleFactor: 1.5),
                      ]),
                    ])),
            SizedBox(
              height: height * 0.01,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.42,   width * 0.13 ),
      
      ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(orderObject)));
                },
                child: Text('Детали заказа',
                style: TextStyle(
                                    color: Color.fromARGB(255, 46, 46, 46)),
                ))
          ]),
        ));
  }
}
