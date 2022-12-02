import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/controllers/CoffeHouseObject.dart';
import 'package:coffe/pages/AuthPage/RegisterPage.dart';
import 'package:coffe/utils/Security/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/Configuration/ThemeData.dart';
import '../../utils/Security/Auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String login = '';
  String password = '';
  String status = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var white;
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: height / 3.5,
          backgroundColor: Colors.white,
          flexibleSpace: Stack(children: [
            Positioned(
                child: FlexibleSpaceBar(
                  background: FittedBox(
  child: Image.asset("assets/images/fon.png"),
  fit: BoxFit.fill,
)),
                top: 0,
                left: 0,
                right: 0,
                bottom: 0),
            Positioned(
                child: FlexibleSpaceBar(
                    title: Text(''),
                    background: Container(
                      height: height / 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Color.fromARGB(126, 255, 255, 255).withOpacity(0.0),
                          Color.fromARGB(21, 255, 255, 255).withOpacity(1.0),
                        ],
                      )),
                    )),
                top: 30,
                left: 0,
                right: 0,
                bottom: 0),
          ])),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 100, 100, 100),
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color.fromARGB(129, 0, 0, 0).withOpacity(0.0),
                      Color.fromARGB(43, 255, 255, 255).withOpacity(0.0),
                    ],
                  )),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Вход',
                    style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontSize: 28)),
                Padding(padding: EdgeInsets.only(top: height * 0.01)),
                SizedBox(
                  height: height * 0.01,
                ),      
                Padding(padding: EdgeInsets.only(top: height * 0.01)),
                Form(
                    key: _formKey,
                    child: Container(
                      width: width * 0.85,
                      child: Column(children: [
                        TextFormField(
                          cursorColor: Color.fromARGB(255, 77, 77, 77),
                          //controller: TextEditingController()..text = dateTime,

                          //initialValue: dateTime,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.,]'))
                          ],
                          validator: (value) => Validator.isPhoneValid(value),
                          onChanged: (String value) {
                            login = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 77, 77, 77),
                            focusColor: Color.fromARGB(255, 77, 77, 77),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color.fromARGB(255, 77, 77, 77),
                                width: 2.0)),
                            prefixIcon: Icon(Icons.phone_iphone, color: Color.fromARGB(255, 94, 94, 94)),
                              labelText: 'Телефон',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 77, 77, 77))),
                        ),
                        Padding(padding: EdgeInsets.only(top: height * 0.03)),
                        TextFormField(
                          cursorColor: Color.fromARGB(255, 97, 97, 97),
                          //controller: TextEditingController()..text = dateTime,
                          obscureText: true,
                          //initialValue: dateTime,
                          validator: (value) =>
                              Validator.isPasswordValid(value),
                          onChanged: (String value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 97, 97, 97),
                            focusColor: Color.fromARGB(255, 97, 97, 97),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              focusedBorder: 
                              OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color.fromARGB(255, 97, 97, 97),
                                width: 2.0)),
                            prefixIcon: Icon(Icons.key, color: Color.fromARGB(255, 97, 97, 97)),
                            labelText: 'Пароль',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97))),
                          ),
                        Text(status, style: TextStyle(color: Colors.red)),
                        Padding(padding: EdgeInsets.only(top: height * 0.01)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
      elevation: 5,
      minimumSize: Size( height * 0.85,   width * 0.15 ),
      ),
     
                            onPressed: () async {
                              _formKey.currentState!.validate();
                              status = await Auth()
                                  .logIn(login: login, password: password);
                              setState(() {});
                            },
                            child: Text('Войти', 
                            style: TextStyle(
                                color: Colors.black, fontSize: 16))),
                        Padding(padding: EdgeInsets.only(top: height * 0.02)),
                        TextButton(
                          // ignore: prefer_const_constructors
                         child: Text('Зарегистрироваться',
                          style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97), fontSize: 14)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RegisterDialog();
                              },
                            );
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: height * 0.02)),
                        TextButton(
                          // ignore: prefer_const_constructors
                         child: Text('Забыли пароль?',
                          style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97), fontSize: 14)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RegisterDialog();
                              },
                            );
                          },
                        ),
                      ]),
                    ))
              ])),
        ]),
      ),
    ]));
  }
}
