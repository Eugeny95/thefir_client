import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/Dialogs/EditTextDialog.dart';
import 'package:coffe/MyWidgets/ViewEditText.dart';
import 'package:coffe/controllers/UserProfileObject.dart';
import 'package:coffe/main.dart';
import 'package:coffe/utils/Security/Validator.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Dialogs/InfoBonuce.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    UserProfile userProfile = Provider.of<UserProfile>(context, listen: true);

    rebuildAllChildren(context);

    //userProfile.addListener(setState())
    return Stack(
      children: [
        Column(children: [
          Stack(children: <Widget>[
            Container(
                height: height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/thefirP.png"),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                height: height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color.fromARGB(50, 0, 0, 0),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: []),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: height * 0.19)),
                        //Icon(Icons.park_sharp),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Профиль пользователя",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic,
                              fontSize: 27,
                              color: Color.fromARGB(169, 38, 38, 38)))
                    ],
                  ),
                ]))
          ]),
          Padding(padding: EdgeInsets.only(top: 150)),
          Container(
            width: width * 0.9,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 95, 93, 93),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.person, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('${userProfile.name}'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 40),
                          ),
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditTextDialog(
                                      'Введите имя', userProfile.name, (text) {
                                    userProfile.name = text;
                                    setState(() {});
                                  });
                                });
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 99, 99, 99),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.phone_iphone, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('${userProfile.phone}'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 40),
                          ),
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditTextDialog(
                                      'Введите телефон', userProfile.phone, (text) {
                                    userProfile.phone = text;
                                    setState(() {});
                                  });
                                });
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.email, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('${userProfile.email}'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 40),
                          ),
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditTextDialog(
                                      'Введите email', userProfile.email, (text) {
                                    userProfile.email = text;
                                    setState(() {});
                                  });
                                });
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.43, width * 0.15),
                  ),
                  onPressed: () {
                    userProfile.requestUserData();

                    if (Validator.isPhoneValid(userProfile.phone) != null) {
                      const snackBar = SnackBar(
                        content: Text('Введите корректный телефон'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    if (Validator.isEmailValid(userProfile.email) != null) {
                      const snackBar = SnackBar(
                        content: Text('Введите корректный email'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    userProfile.updateProfile();

                    // TODO: validator
                  },
                  child: Text('Обновить профиль',
                      style:
                          TextStyle(color: Color.fromARGB(255, 55, 55, 55)))),
            ]),
          ),
        ]),
        Positioned(
            top: height / 3.4,
            left: width * 0.10,
            child: SizedBox(
                width: width * 0.8,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 20,
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Бонусная карта",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 1
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 2
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 3
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 4
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 5
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 6
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses >= 7
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                            SizedBox(
                              width: width / 50,
                            ),
                            Container(
                                width: width / 7,
                                height: height / 14,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userProfile.bonuses > 8
                                        ? Color.fromARGB(164, 230, 190, 134)
                                        : Color.fromARGB(255, 239, 239, 239)),
                                child: Icon(IcoFontIcons.coffeeAlt, size: height * 0.05)),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        )
                      ],
                    )))),
        Positioned(
            top: height / 3.5,
            left: width * 0.79,
            child: IconButton(
                icon: Icon(Icons.info_outline_rounded,
                    size: 20, color: Color.fromARGB(255, 103, 103, 103)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InfoDialog(
                          // Provider.of<CoffeHouse>(context, listen: true)
                          //     .photos
                          );
                    },
                  );
                })),
      ],
    );
  }
}
