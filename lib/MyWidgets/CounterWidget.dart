import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  late Function(int counter) onChange;
  CounterWidget({required this.onChange});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterWidgetState(onChange);
  }
}

class CounterWidgetState extends State<CounterWidget> {
  int counter = 1;
  var onChange;
  CounterWidgetState(this.onChange);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      children: [
        Text('Введите количество'),
        IconButton(
            onPressed: () {
              setState(() {
                counter--;
                if (counter < 0) counter = 0;
                onChange(counter);
              });
            },
            icon: Icon(Icons.remove)),
        Text(counter.toString()),
        IconButton(
            onPressed: () {
              setState(() {
                counter++;
                onChange(counter);
              });
            },
            icon: Icon(Icons.add)),
      ],
    ));
  }
}
