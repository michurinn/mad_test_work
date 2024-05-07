// Interface for a component
abstract interface class Message {
  abstract final String text;
}

// Concrete component
class TextMessage implements Message {
  TextMessage(this.text);

  @override
  final String text;
}

// interface for a decorator
abstract interface class MessageModel implements Message {
  MessageModel(this.message);
  final Message message;
}

// concrte decorator
class MessageUpperCase extends MessageModel {
  MessageUpperCase(super.message);

  @override
  String get text => message.text.toUpperCase();
}

void main() {
  final message = TextMessage('{"Hello": "world"}');
  final messageJsonModel = MessageUpperCase(message);
  print(messageJsonModel.text);
}
