// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageStore on _MessageStore, Store {
  late final _$_messagesAtom =
      Atom(name: '_MessageStore._messages', context: context);

  @override
  ObservableList<Message> get _messages {
    _$_messagesAtom.reportRead();
    return super._messages;
  }

  @override
  set _messages(ObservableList<Message> value) {
    _$_messagesAtom.reportWrite(value, super._messages, () {
      super._messages = value;
    });
  }

  late final _$setMessagesAsyncAction =
      AsyncAction('_MessageStore.setMessages', context: context);

  @override
  Future setMessages(List<Message> messages) {
    return _$setMessagesAsyncAction.run(() => super.setMessages(messages));
  }

  late final _$addMessageAsyncAction =
      AsyncAction('_MessageStore.addMessage', context: context);

  @override
  Future addMessage(Message message) {
    return _$addMessageAsyncAction.run(() => super.addMessage(message));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
