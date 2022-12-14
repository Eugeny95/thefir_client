import 'package:coffe/controllers/OrdersObject.dart';
import 'package:coffe/pages/BasketPage/OrderPage.dart';
import 'package:coffe/utils/payments/SberAcquiring.dart';
import '../../MyWidgets/OrderPreview.dart';
import '../../MyWidgets/PositionWidget.dart';
import '../../controllers/OrdersController.dart';
import '/controllers/BasketObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    // TODO: implement createState
    return StorePageState();
  }
}

class StorePageState extends State<StorePage> {
  
  @override
  Widget build(BuildContext context) {
    BasketObject basket = Provider.of<BasketObject>(context);
        OrderController _orderController =  Provider.of<OrderController>(context, listen: true);

    List<Widget> positions = [];
     List<OrderPreview> orders = [];
    for (int i = 0; i < _orderController.historyOrders.length; i++) {
      orders.add(OrderPreview(
        _orderController.historyOrders[i],
        key: UniqueKey(),
      ));
    }
    for (var item in basket.coffePositions) {
      positions.add(PositionWidget(coffe: item, key: UniqueKey()));
    }
    
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('История заказов',
            style: TextStyle(color: Colors.black))),
          body: ListView(
            children: [Column(children: positions), Column(children: orders,)],
          ));
    }
    // TODO: implement build
  }


