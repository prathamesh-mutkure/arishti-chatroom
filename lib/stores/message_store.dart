import 'package:arishti_chatroom/models/message_model.dart';
import 'package:mobx/mobx.dart';

part 'message_store.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store {
  @observable
  ObservableList<Message> _messages = ObservableList<Message>();

  ObservableList<Message> get messages => _messages;

  @action
  setMessages(List<Message> messages) async {
    _messages = ObservableList.of(messages);
  }

  @action
  addMessage(Message message) async {
    _messages.add(message);

    // TODO: Sort here
  }
}
