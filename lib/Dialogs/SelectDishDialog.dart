import 'package:cached_network_image/cached_network_image.dart';
import '/controllers/BasketObject.dart';
import '../MyWidgets/CounterWidget.dart';
import '/MyWidgets/AddPicture.dart';
import '/MyWidgets/DropListWrapper.dart';
import '/controllers/CoffeHouseObject.dart';
import '../controllers/DishObject.dart';
import '/utils/Network/RestController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO можно в будущем сделать категории подгружаемыми с интернета

class SelectDishDialog extends StatefulWidget {
  DishObject dish;

  SelectDishDialog(this.dish);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectDishDialogState(dish);
  }
}

class SelectDishDialogState extends State<SelectDishDialog> {
  String image = '';
  DishObject dish;

  SelectDishDialogState(this.dish) {
    dish.fieldSelection.selectedField = dish.fieldSelection.fields.first;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> propertiesWidget = [];
    List<Widget> volumesWidget = [];
    for (int i = 0; i < dish.options.length; i++) {
      propertiesWidget.add(Row(children: [
        Expanded(
          child: Text(dish.options[i].name),
          flex: 3,
        ),
        Text(dish.options[i].price.toString()),
        Checkbox(
          value: dish.options[i].isSelected,
          onChanged: (value) {
            setState(() {
              print('used ${value}');
              dish.options[i].isSelected = value!;
            });
          },
        ),
      ]));
    }
    for (Option volume in dish.fieldSelection.fields) {
      volumesWidget.add(Row(children: [
        Expanded(
          child: Text(volume.name.toString()),
          flex: 3,
        ),
        Text(volume.price.toString()),
        Radio(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            focusColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            value: volume,
            groupValue: dish.fieldSelection.selectedField,
            onChanged: (Option? value) {
              setState(() {
                dish.fieldSelection.selectedField = value!;
              });
            }),
      ]));
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 25;
    return AlertDialog(

        insetPadding: EdgeInsets.all(20),
        title: Text(
          dish.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        actionsAlignment: MainAxisAlignment.center,
        content: Container(
          height: height * 0.9,
          width: width * 0.96,
          child: ListView(shrinkWrap: true, children: [
            Container(
                //width: width * 0.8,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              // 666666666666665Divider(color: Colors.black),
              Container(
                height: height / 4.5,
              decoration: BoxDecoration(
                  color: Colors.black54,
                    borderRadius: BorderRadius.circular(20.0)),
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: 
                CachedNetworkImage(
                imageUrl: dish.picture,
                height: height / 5,
              ),
              )),
              Divider(color: Colors.black),
              dish.description.isNotEmpty
                  ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Описание: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(dish.description)
                    ])
                  : Row(),
              dish.description.isNotEmpty
                  ? Divider(color: Colors.black)
                  : Row(),

              dish.category == 'coffe'
                  ? Text(
                      'Доступные объемы',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'Масса блюда',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  Padding(padding: EdgeInsets.only(top: height * 0.02)),
              Row(children: [
                Expanded(
                  child: dish.category == 'coffe'
                      ? Text('Объем, мл',
                          style:
                              TextStyle(color: Colors.white, fontSize: fontSize))
                      : Text('Масса, г',
                          style:
                              TextStyle(color: Colors.white, fontSize: fontSize)),
                  flex: 6,
                ),
                Expanded(
                  child: Text(
                    'Цена,руб',
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  ),
                  flex: 2,
                ),
              ]),
              Column(children: volumesWidget),
              dish.options.isEmpty ? Row() : Divider(color: Colors.black),
              dish.options.isEmpty
                  ? Text('')
                  : Text(
                      'Выберите добавки',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.02)),
              dish.options.isEmpty
                  ? Row()
                  : Row(children: [
                      Expanded(
                        child: Text('Название добавки',
                            style: TextStyle(
                                color: Colors.white, fontSize: fontSize)),
                        flex: 6,
                      ),
                      Expanded(
                        child: Text(
                          'Цена,руб',
                          style:
                              TextStyle(color: Colors.white, fontSize: fontSize),
                        ),
                        flex: 2,
                      ),
                    ]),
              Column(children: propertiesWidget),
              Divider(color: Colors.black),
              CounterWidget(
                onChange: ((counter) {
                  dish.count = counter;
                }),
              ),
              Divider(color: Colors.black),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.85,   width * 0.15 ),
      ),
                  onPressed: () {
                    Provider.of<BasketObject>(context, listen: false)
                        .addCoffe(dish);
                    Navigator.pop(context);
                  },
                  child: Text('Добавить в корзину')),
            ]))
          ]),
        ),
        shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))));
    // TODO: implement build
  }
}
