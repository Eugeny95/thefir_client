import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/Security/Validator.dart';

class EditTextDialog extends StatefulWidget {
  String caption='';
  String text = '';
  dynamic onComplete;
  EditTextDialog(this.caption, this.text, this.onComplete);

  @override
  State<EditTextDialog> createState() => _EditTextDialogState(caption, text, onComplete);
}

class _EditTextDialogState extends State<EditTextDialog> {
  String caption='';
  String text = '';
  dynamic onComplete;
  _EditTextDialogState(this.caption, this.text, this.onComplete);
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
        title: Text(''),
        content: Container(
          
          height: height * 0.1,
          child:Column(children: [Text('$caption'), TextFormField(
                        cursorColor: Color.fromARGB(255, 97, 97, 97),
                        controller: TextEditingController()..text = text,

                        //initialValue: dateTime,
                        validator: (value) => Validator.isPasswordValid(value),
                        onChanged: (String value) {
                          text = value;
                        },
                        
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color.fromARGB(255, 97, 97, 97),
                                width:2.0)),
                          
                          
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97))),
                      ),])),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.32,   width * 0.1 ),
      ),
            child: Text('Ввод',
            style: TextStyle(
              color: Color.fromARGB(255, 36, 36, 36),
            ),),
            onPressed: () {
              onComplete(text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );;
  }
}
