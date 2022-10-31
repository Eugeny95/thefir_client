import 'package:coffe/utils/ChatEngine/ChatHandlers.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../Security/Auth.dart';
import 'ChatModel.dart';

class ChatController with ChangeNotifier {
  late IO.Socket socket;
  late ChatHandlers chatHandlers;
  ChatModel chatModel = ChatModel();
  late var box;
  void socketReInit() {
    socket = IO.io(
        'http://thefir.ddns.net:5050',
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({
          'foo': 'bar',
          'Authorization': 'Bearer ${Auth().accessToken}',
        }) // optional
            .build());
  }

  ChatController() {
    socketReInit();
    chatHandlers = ChatHandlers(this);
    socket.connect();
    socket.onConnect((_) {
      print('connect');
    });
    socket.on('message', (data) => chatHandlers.onMeassage(data));
    socket.onDisconnect((data) => print('disconnect'));
    socket.on('status', (data) => chatHandlers.onMeassage(data));
    socket.on('typing', (data) => chatHandlers.onMeassage(data));
    socket.on('delivered', (data) => chatHandlers.onMeassage(data));
    socket.on('friend', (data) => chatHandlers.onMeassage(data));
  }

  void connect(address) {
    socketReInit();
    socket.connect();
  }

  void sendMessage(String senderLogin, String recieverLogin, message) {
    String jsonString =
        '{"sender_login":"$senderLogin", "reciever_login":"$recieverLogin", "message":"$message"}';
    socketReInit();
    socket.emit('message', jsonString);
  }

  void statusRequest(String recieverLogin) {
    String jsonString = '{"reciever_login":"$recieverLogin"}';
    socketReInit();
    socket.emit('status', jsonString);
  }

  void sendTyping(String senderLogin, String recieverLogin) {
    String jsonString =
        '{"sender_login":"$senderLogin", "reciever_login":"$recieverLogin"';
    socketReInit();
    socket.emit('typing', jsonString);
  }

  void sendFriendlyRequest(String senderLogin, String recieverLogin) {
    String jsonString =
        '{"sender_login":"$senderLogin", "reciever_login":"$recieverLogin"';
    socketReInit();
    socket.emit('typing', jsonString);
    socketReInit();
  }

  ChatModel getChatModel() {
    chatModel = ChatModel();
    // var temp = box.get('abonents');
    // if (temp != null) chatModel = temp;
    return chatModel;
  }

  void addContact(login, name) async {
    print(chatModel);
    box = await Hive.openBox('chat_model');
    chatModel.abonents.add(Abonent());
    //chatModel.save();
    box.put('abonents', chatModel);

    /// chatModel = box.get('abonents');
    notifyListeners();
  }
}
