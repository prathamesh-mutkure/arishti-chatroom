import 'dart:convert';

import 'package:arishti_chatroom/constants/api_endpoints.dart';
import 'package:arishti_chatroom/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final Map<String, String> _headers = {
    "content-type": "application/json",
  };

  static Future<dynamic> get(String endpoint) async {
    try {
      final url = Uri.parse(APIEndpoint.baseURL + endpoint);

      http.Response response = await http.get(url);

      return _returnResponse(response);
    } catch (error) {
      debugPrint("Error in $endpoint -> $error");
    }
  }

  static Future<dynamic> authGet(String endpoint, User user) async {
    try {
      final url = Uri.parse(APIEndpoint.baseURL + endpoint);

      http.Response response = await http.get(
        url,
        headers: <String, String>{"Authorization": "Bearer ${user.token}"},
      );

      return _returnResponse(response);
    } catch (error) {
      debugPrint("Error in $endpoint -> $error");
    }
  }

  static Future<dynamic>? post(String endpoint, Object body) async {
    try {
      final url = Uri.parse(APIEndpoint.baseURL + endpoint);

      http.Response response = await http.post(
        url,
        headers: _headers,
        body: jsonEncode(body),
      );

      return _returnResponse(response);
    } catch (error) {
      // TODO: Handle error
      debugPrint("Error in $endpoint -> $error");
      return null;
    }
  }

  // TODO: Implement Auth Post

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      default:
        throw Exception(
          "Error ${response.statusCode}: ${jsonDecode(response.body)}",
        );
    }
  }
}
