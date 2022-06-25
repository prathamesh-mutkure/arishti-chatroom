import 'package:arishti_chatroom/constants/api_endpoints.dart';
import 'package:arishti_chatroom/constants/routes.dart';
import 'package:arishti_chatroom/helpers/APIHelper.dart';
import 'package:arishti_chatroom/models/user_model.dart';
import 'package:arishti_chatroom/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthAPI {
  AuthAPI._();

  static Future<User?> login(
    String username,
    String password,
    BuildContext context,
  ) async {
    final response = await APIHelper.post(
      APIEndpoint.login,
      {"username": username, "password": password},
    );

    User user = User.fromJson(response);

    context.read<UserStore>().login(user);

    return user;
  }

  static void logout(BuildContext context) async {
    context.read<UserStore>().logout();

    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.welcome,
      (route) => false,
    );
  }
}
