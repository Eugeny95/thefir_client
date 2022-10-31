import 'package:hive/hive.dart';

class Message {
  String message = '';
  String time = '';
  int recieverLogin = 0;
  int senderLogin = 0;
  bool isDelivered = false;
  bool isRead = false;
}

@HiveType(typeId: 1)
class Abonent extends HiveObject {
  @HiveField(0)
  String login = '';
  @HiveField(1)
  String name = '';
  // @HiveField(2)
  // List<Message> messages = [];
}

class AbonentAdapter extends TypeAdapter<Abonent> {
  @override
  read(BinaryReader reader) {
    Abonent abonent = Abonent();
    abonent.login = reader.read();
    abonent.name = reader.read();
    // abonent.messages = reader.read();

    return abonent;
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, obj) {
    writer.write(obj.login);
    writer.write(obj.name);
    // writer.write(obj.messages);
  }
}

@HiveType(typeId: 0)
class ChatModel extends HiveObject {
  @HiveField(0)
  List<Abonent> abonents = [];
}

class ChatModelAdapter extends TypeAdapter<ChatModel> {
  @override
  ChatModel read(BinaryReader reader) {
    // TODO: implement read
    return ChatModel()..abonents = reader.read();
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, ChatModel obj) {
    writer.write(obj.abonents);
  }
}
