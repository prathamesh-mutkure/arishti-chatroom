import 'dart:convert';

import 'package:arishti_chatroom/constants/api_endpoints.dart';
import 'package:arishti_chatroom/constants/styles.dart';
import 'package:arishti_chatroom/models/message_model.dart';
import 'package:arishti_chatroom/models/user_model.dart';
import 'package:arishti_chatroom/network/auth_apis.dart';
import 'package:arishti_chatroom/network/message_apis.dart';
import 'package:arishti_chatroom/stores/message_store.dart';
import 'package:arishti_chatroom/stores/user_store.dart';
import 'package:arishti_chatroom/widgets/home/MessageContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController messageTextController = TextEditingController();
  String messageText = "";
  IO.Socket? socket;

  @override
  void initState() {
    MessageAPI.getAllMessages(context);
    connectAndListen(context);
    super.initState();
  }

  @override
  void dispose() {
    socket?.disconnect();
    socket?.dispose();
    messageTextController.dispose();
    super.dispose();
  }

  // TODO: Organise Sockets and sendMessage into separate Files/Classes
  void connectAndListen(BuildContext context) async {
    socket = IO.io(
      APIEndpoint.backendURL,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setQuery(<String, dynamic>{
            "token": context.read<UserStore>().currentUser?.token
          })
          .enableForceNewConnection()
          .enableReconnection()
          .build(),
    );

    socket?.on("NEW_MESSAGE", (dynamic data) {
      try {
        final json = jsonDecode(data);
        Message message = Message.fromJson(json);

        context.read<MessageStore>().addMessage(message);
      } catch (err) {
        debugPrint("Invalid Message Data: $err");
      }
    });

    socket?.onConnectError((err) {
      debugPrint("Connection Error: $err");
    });

    socket?.onError((err) {
      debugPrint("Socket Error: $err");
    });
  }

  void sendMessage() {
    User? currentUser = context.read<UserStore>().currentUser;

    if (currentUser == null) return;

    Message message = Message(
      id: "",
      text: messageTextController.text,
      fromId: currentUser.id,
      fromUsername: currentUser.username,
    );

    socket?.emit(
      'NEW_MESSAGE',
      jsonEncode(message.toJson()),
    );

    messageTextController.clear();
  }

  void logOut() {
    AuthAPI.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logOut,
          ),
        ],
        title: const Text('Arishti Chatroom'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessageContainer(),
            Container(
              decoration: Styles.messageContainerDecoration,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) => messageText = value,
                      decoration: Styles.messageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: sendMessage,
                    child: const Text(
                      'Send',
                      style: Styles.sendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
