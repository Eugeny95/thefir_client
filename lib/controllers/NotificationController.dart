


import 'package:flutter/material.dart';

class Notification{
  String title='';
  String content = '';
}

class NotificationController with ChangeNotifier{

 static final NotificationController _notificationController = NotificationController._instance();
 factory NotificationController(){
  return _notificationController;
 }

 NotificationController._instance();
 

}