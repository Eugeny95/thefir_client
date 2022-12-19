import 'package:coffe/controllers/OrdersController.dart';
import 'package:coffe/controllers/OrdersObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import '../../controllers/BasketObject.dart';
import '../../controllers/DishObject.dart';

class OrderPage extends StatefulWidget {
  OrderObject? _orderObject;
  OrderPage(this._orderObject);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderPageState(this._orderObject);
  }
}

Set onPlace = {true, false};
bool valueRadio = true;
String mytime = '5 минут';

class OrderPageState extends State<OrderPage> {
  OrderObject? _orderObject;
  OrderPageState(this._orderObject);
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> coffeLines = [];
    for (DishObject line in _orderObject!.basketObject.coffePositions) {
      coffeLines.add(Container(
          width: width * 0.85,
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Text(line.name,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 81, 81, 81),
                        fontSize: 22)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  line.fieldSelection.selectedField!.name + ' мл',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 97, 97, 97), fontSize: 20),
                ),
                flex: 1,
              ),
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Добавки:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 97, 97, 97),
                            //  fontWeight: FontWeight.bold,
                            fontSize: 15))),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: line.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return line.options[index].isSelected
                              ? Text(line.options[index].name,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 97, 97, 97), fontSize: 15))
                              : Column();
                        })),
              ],
            ),
            Row(children: [
              Expanded(
                child: Text('Количество:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 97, 97, 97),
                        fontSize: 15)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  line.count.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 97, 97, 97), fontSize: 15),
                ),
                flex: 1,
              ),
            ]),
            Row(children: [
              Expanded(
                child: Text('Стоимость:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 97, 97, 97),
                        fontSize: 15)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  line.totalCost.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 97, 97, 97), fontSize: 15),
                ),
                flex: 1,
              ),
            ]),
            Divider(color: Color.fromARGB(255, 86, 86, 86)),
            SizedBox(
              height: 10,
            ),
          ])));
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white, 
        title: Text('Оформление заказа',
        style: TextStyle(color: Colors.black))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  width: width * 0.97,
                  child: Card(
                      elevation: 15,
                      child: Column(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1),
                                    topRight: Radius.circular(1),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            title: Text('Детали заказа'),
                            tileColor: Color.fromARGB(255, 219, 219, 219),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: coffeLines,
                          ),
                          Divider(
                            color: Color(0xFF070707),
                            height: 25,
                          ),
                          Text(
                            'Итого: ${_orderObject!.basketObject.total} руб.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 97, 97),
                                fontSize: 23),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Color(0xFF070707),
                            height: 25,
                          ),
                          Container(
                              width: width * 0.9,
                              child: Column(children: [
                                Row(children: [
                                  Text('Время готовности:',
                                  style: TextStyle(
                                        color: Color.fromARGB(255, 97, 97, 97),
                                        fontSize: 18)),
                                  Text(
                                    ' ' + mytime + ' ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 96, 96, 96),
                                        fontSize: 18),
                                  )
                                ]),
                                Padding(padding: EdgeInsets.only(top: height * 0.01)),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                         shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12), // <-- Radius
                                        ),
                                           elevation: 5,
                                          minimumSize: Size( height * 0.35,   width * 0.12 ),
                                            ),
                                          onPressed: () async {
                                            DatePicker.showTimePicker(
                                              context,
                                              locale: LocaleType.ru,
                                              onConfirm: (time) {
                                                print('change $time');
                                                mytime = time
                                                    .toString()
                                                    .substring(0, 16);
                                                _orderObject!.requiredDateTime =
                                                    mytime;
                                                setState(() {});
                                              },
                                            );
                                          },
                                          child: Text('Выбрать время',
                                          style: TextStyle(color: Colors.black)))
                                    ])
                              ])),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Color.fromARGB(255, 95, 95, 95)),
                                    focusColor: MaterialStateColor.resolveWith(
                                        (states) => Color.fromARGB(255, 32, 32, 32)),
                                    value: false,
                                    groupValue: valueRadio,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        valueRadio = value!;
                                        _orderObject!.onPlace = valueRadio;
                                      });
                                    }),
                                Text('С собой'),
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Color.fromARGB(255, 97, 97, 97)),
                                    focusColor: MaterialStateColor.resolveWith(
                                        (states) => Color.fromARGB(255, 53, 53, 53)),
                                    value: true,
                                    groupValue: valueRadio,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        valueRadio = value!;
                                        _orderObject!.onPlace = valueRadio;
                                      });
                                    }),
                                Text('На месте'),
                              ]),
                        ],
                      )))),
          ElevatedButton(
             style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.43,   width * 0.15 ),
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      ),
            // ignore: prefer_const_constructors
            child: Text('Заказать',
            style: (TextStyle(
              fontSize: 18,
              color: Colors.black))),
            onPressed: () {
              if (mytime == '5 минут') {
                _orderObject!.requiredDateTime = new DateTime.now()
                    .add(new Duration(minutes: 5))
                    .toString()
                    .substring(0, 16);
              }
              _orderObject!.sendOrder();
              Provider.of<BasketObject>(context, listen: false).count = 0;
              Provider.of<BasketObject>(context, listen: false).coffePositions =
                  [];
              Provider.of<BasketObject>(context, listen: false)
                  .notifyListeners();
                   Provider.of<OrderController>(context, listen: false).getActiveOrders();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
