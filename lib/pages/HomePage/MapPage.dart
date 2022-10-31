import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Configuration/ThemeData.dart';

class MapPage extends StatefulWidget {
  @override
  MyWidget createState() {
    return MyWidget();
  }
}

class MyWidget extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text('Карта', style: MyTheme().text1Style)),
        body: Container(
            height: height,
            width: width,
            child: WebView(
              initialUrl: Uri.dataFromString(
                      '<div style="position:relative;overflow:hidden;"><a href="https://yandex.ru/maps/org/thefir_coffee/87155301425/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:0px;">Thefir Coffee</a><a href="https://yandex.ru/maps/193/voronezh/category/coffee_shop/35193114937/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:25px;position:relative;top:14px;"></a><a href="https://yandex.ru/maps/193/voronezh/category/confectionary/184108017/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:25px;position:absolute;top:28px;"></a><iframe src="https://yandex.ru/map-widget/v1/-/CCUJu0VihD" width="100%" height="100%" frameborder="1" allowfullscreen="true" style="position:relative;"></iframe></div>',
                      mimeType: 'text/html')
                  .toString(),
              javascriptMode: JavascriptMode.unrestricted,
            )));
  }
}
