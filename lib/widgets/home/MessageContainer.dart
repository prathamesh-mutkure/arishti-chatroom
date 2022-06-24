import 'package:arishti_chatroom/stores/message_store.dart';
import 'package:arishti_chatroom/stores/user_store.dart';
import 'package:arishti_chatroom/widgets/home/MessageBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var messages = context.watch<MessageStore>().messages;
        var currentUser = context.watch<UserStore>().currentUser;

        // messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        // TODO: Check Sorting

        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messages
                .map(
                  (message) => MessageBox(
                    text: message.text,
                    sender: message.fromUsername,
                    isMe: currentUser?.username == message.fromUsername,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
