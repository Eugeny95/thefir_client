import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe/MyWidgets/ViewEditText.dart';
import 'package:coffe/controllers/UserProfileObject.dart';
import 'package:coffe/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final userProfile = Provider.of<UserProfile>(context, listen: true);
    rebuildAllChildren(context);

    //userProfile.addListener(setState())
    return Stack(
      children: [
        Column(children: [
          Container(
              height: height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 138, 138, 138),
                      Color.fromARGB(255, 25, 25, 25),
                    ],
                  )),
              child: Column(children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: []),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: height * 0.18)),
                      Icon(Icons.supervised_user_circle, size: width / 3)
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Профиль пользователя",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //fontStyle: FontStyle.italic,
                            fontSize: 22,
                            color: Colors.white))
                  ],
                ),
              ])),
          Padding(padding: EdgeInsets.only(top: 150)),
          Container(
            width: width * 0.9,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                  color: Color.fromARGB(255, 255, 254, 254),
                  width: 1,
                )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.person, size: 40),
                    VerticalDivider(
                      color: Colors.white,
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('${userProfile.name}'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                          child: Icon(Icons.edit, size: 40),
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
                  color: Color.fromARGB(255, 255, 254, 254),
                  width: 1,
                )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.phone_iphone, size: 40),
                    VerticalDivider(
                      color: Colors.white,
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('${userProfile.phone}'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                          child: Icon(Icons.edit, size: 40),
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
                  color: Color.fromARGB(255, 255, 254, 254),
                  width: 1,
                )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.email, size: 40),
                    VerticalDivider(
                      color: Colors.white,
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('${userProfile.email}'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                          child: Icon(Icons.edit, size: 40),
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
      minimumSize: Size( height * 0.43,   width * 0.15 ),
      ),
                onPressed: () {}, child: Text('Обновить профиль'))
            ]),
          ),
        ]),
        Positioned(
            top: height / 3.4,
            left: width * 0.05,
            child: Container(
                width: width * 0.9,
                child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Бонусный баланс: ",
                                style: TextStyle(),
                              ),
                              Text('${userProfile.bonuses}',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              Text(
                                "",
                                style: TextStyle(),
                              ),
                            ]),
                        Card(
                          color: Colors.white,
                          elevation: 10,
                          child: QrImage(
                            data: userProfile.ids.toString(),
                            version: QrVersions.auto,
                            size: width * 0.3,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        )
                      ],
                    ))))
      ],
    );
  }
}
