import 'package:coffe/controllers/UserProfileObject.dart';
import 'package:coffe/pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewEditText extends StatefulWidget {
  TextInputType textType;
  String? data;
  Function(String value) onChange;
  ViewEditText(
      {required this.data,
      required this.onChange,
      required this.textType,
      Key? key});

  @override
  State<ViewEditText> createState() =>
      _ViewEditTextState(this.data, this.onChange, this.textType);
}

class _ViewEditTextState extends State<ViewEditText> {
  late TextInputType textType;
  late Function(String value) onChange;
  Widget? icon;
  String? data;
  _ViewEditTextState(this.data, this.onChange, this.textType) {
    if (textType == TextInputType.name)
      icon = const Icon(Icons.person, size: 40);
    if (textType == TextInputType.phone)
      icon = const Icon(Icons.phone, size: 40);
    if (textType == TextInputType.emailAddress)
      icon = const Icon(Icons.email, size: 40);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromARGB(255, 255, 254, 254),
        width: 1,
      )),
      child: IntrinsicHeight(
          child: Row(
        children: [
          icon!,
          VerticalDivider(
            color: Colors.white,
            width: 5,
            thickness: 1,
          ),
          Expanded(
            child: Text('$data'),
            flex: 7,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.white,
                  width: 1,
                )),
                child: Icon(Icons.edit, size: 40),
              ))
        ],
      )),
    );
  }
}
