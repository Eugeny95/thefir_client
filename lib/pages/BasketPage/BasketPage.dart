import 'package:coffe/controllers/OrdersObject.dart';
import 'package:coffe/utils/payments/SberAcquiring.dart';
import '../../MyWidgets/OrderPreview.dart';
import '../../MyWidgets/PositionWidget.dart';
import '../../controllers/OrdersController.dart';
import '/controllers/BasketObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'OrderPage.dart';

class BasketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasketPageState();
  }
}

class BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    BasketObject basket = Provider.of<BasketObject>(context);
        OrderController _orderController =  Provider.of<OrderController>(context, listen: true);

    List<Widget> positions = [];
     List<OrderPreview> orders = [];
    for (int i = 0; i < _orderController.activeOrders.length; i++) {
      orders.add(OrderPreview(
        _orderController.activeOrders[i],
        key: UniqueKey(),
      ));
    }
    for (var item in basket.coffePositions) {
      positions.add(PositionWidget(coffe: item, key: UniqueKey()));
    }
    if (basket.coffePositions.isEmpty) {
      return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Корзина',
            style: TextStyle(color: Colors.black))),
          body: ListView(
            children: [Column(children: orders,)],
          ));
    } else {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 25;
      positions.add(Column(
        children: [
          Divider(color: Color.fromARGB(255, 64, 64, 64)),
          Text('Итого: ' + basket.total.toString(),
          style: TextStyle(fontSize: 20)),
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.85,   width * 0.15 ),
      ),
              onPressed: () {
                Provider.of<OrderObject>(context, listen: false).basketObject =
                    basket;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderPage(
                            Provider.of<OrderObject>(context,
                                listen: true)))); //PayView()));
              },
              child: Text('Оформить заказ',
              style: (TextStyle(
              fontSize: 17,
              color: Colors.black))))
        ],
      ));
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Корзина',
            style: TextStyle(color: Colors.black))),
          body: ListView(
            children: [Column(children: positions), Column(children: orders,)],
          ));
    }
    // TODO: implement build
  }
}
