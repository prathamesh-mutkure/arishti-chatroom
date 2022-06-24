import 'package:arishti_chatroom/constants/api_endpoints.dart';
import 'package:arishti_chatroom/helpers/APIHelper.dart';
import 'package:arishti_chatroom/models/message_model.dart';
import 'package:arishti_chatroom/models/user_model.dart';
import 'package:arishti_chatroom/stores/message_store.dart';
import 'package:arishti_chatroom/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageAPI {
  MessageAPI._();

  static Future<dynamic> getAllMessages(BuildContext context) async {
    User? user = context.read<UserStore>().currentUser;

    if (user == null) return [];

    final response = await APIHelper.authGet(APIEndpoint.getMessages, user);
    final messages = response['messages'];

    List<Message> messageList =
        messages.map<Message>((message) => Message.fromJson(message)).toList();

    context.read<MessageStore>().setMessages(messageList);

    return messageList;
  }
}
