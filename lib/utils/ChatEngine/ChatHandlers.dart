import 'package:coffe/utils/ChatEngine/ChatController.dart';

class ChatHandlers {
  ChatController chatController;
  ChatHandlers(this.chatController);
  void onMeassage(String data) {
    print(data);
  }
}
