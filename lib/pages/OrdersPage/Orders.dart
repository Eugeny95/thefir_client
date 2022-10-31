import 'package:coffe/MyWidgets/OrderPreview.dart';
import 'package:coffe/controllers/OrdersController.dart';
import 'package:coffe/controllers/OrdersObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final focusKey = ValueKey('focus');
  @override
  Widget build(BuildContext context) {
    OrderController _orderController =
        Provider.of<OrderController>(context, listen: true);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<OrderPreview> orders = [];
    for (int i = 0; i < _orderController.activeOrders.length; i++) {
      orders.add(OrderPreview(
        _orderController.activeOrders[i],
        key: UniqueKey(),
      ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Мои заказы'),
        ),
        body: ListView(children: orders));
  }
}
