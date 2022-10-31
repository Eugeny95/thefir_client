// TODO можно в будущем сделать категории подгружаемыми с интернета

import 'package:coffe/utils/Network/RestController.dart';
import 'package:coffe/utils/Security/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterDialog extends StatefulWidget {
  RegisterDialog();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterDialogState();
  }
}

class RegisterDialogState extends State<RegisterDialog> {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String status = '';
  RegisterDialogState() {}
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
        insetPadding: EdgeInsets.all(20),
        title: Text('Регистрация'),
        actionsAlignment: MainAxisAlignment.center,
        content: Container(
            width: width,
            child: ListView(children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: height * 0.03)),
                      TextFormField(
                        cursorColor: Colors.white,
                        validator: (value) {},
                        onChanged: (String value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white,
                                width: 2.0)),
                          prefixIcon: Icon(Icons.person_add,color: Colors.white),
                          labelText: 'Имя',
                        labelStyle: TextStyle(
                                color: Colors.white)),
                      ),
                      Padding(padding: EdgeInsets.only(top: height * 0.03)),
                      TextFormField(
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
                        ],
                        validator: (value) => Validator.isPhoneValid(value),
                        onChanged: (String value) {
                          phone = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white,
                                width: 2.0)),
                          prefixIcon: Icon(Icons.phone_iphone, color: Colors.white),
                          labelText:
                              'Телефон',
                        labelStyle: TextStyle(
                                color: Colors.white)),
                      ),
                      Padding(padding: EdgeInsets.only(top: height * 0.03)),
                      TextFormField(
                        cursorColor: Colors.white,
                        //controller: TextEditingController()..text = dateTime,

                        //initialValue: dateTime,
                        validator: (value) => Validator.isEmailValid(value),
                        onChanged: (String value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white,
                                width: 2.0)),
                          prefixIcon: Icon(Icons.mail, color: Colors.white),
                          labelText: 'Email',
                        labelStyle: TextStyle(
                                color: Colors.white)),
                      ),
                      Padding(padding: EdgeInsets.only(top: height * 0.03)),
                      TextFormField(
                        cursorColor: Colors.white,
                        //controller: TextEditingController()..text = dateTime,

                        //initialValue: dateTime,
                        validator: (value) => Validator.isPasswordValid(value),
                        onChanged: (String value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white,
                                width: 2.0)),
                          prefixIcon: Icon(Icons.key, color: Colors.white),
                          labelText: 'Пароль',
                            labelStyle: TextStyle(
                                color: Colors.white)),
                      ),
                      Text(
                        status,
                        style: TextStyle(color: Colors.red),
                      ),
                      Padding(padding: EdgeInsets.only(top: height * 0.15)),
                      ElevatedButton(
                         style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.85,   width * 0.15 ),
      ),
                          onPressed: () {
                            _formKey.currentState!.validate();
                            String data =
                                '{"name":"$name", "phone":"$phone", "email":"$email", "password":"$password", "role":"client"}';
                            print(data);
                            print('yes');
                            RestController().sendPostRequest(
                                onComplete: (
                                    {required String data,
                                    required int statusCode}) {
                                  print(statusCode);
                                  Navigator.pop(context);
                                },
                                onError: ({required int statusCode}) {
                                  if (statusCode == 500) {
                                    status = 'Введены некорректные данные';
                                  }

                                  if (statusCode == 409) {
                                    status = 'Пользователь существует';
                                  }
                                  this.setState(() {});
                                },
                                controller: 'client',
                                data: data);
                          },
                          child: Text('Зарегестрироваться')),
                      Padding(padding: EdgeInsets.only(top: height * 0.02)),
                      TextButton(
                        child: Text(
                          'Отмена',
                          style: TextStyle(
                                color: Colors.white, fontSize: 14)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ))
            ])),
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                    );

    // TODO: implement build
  }
}
