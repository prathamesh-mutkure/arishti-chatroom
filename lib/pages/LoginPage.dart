import 'package:arishti_chatroom/constants/routes.dart';
import 'package:arishti_chatroom/models/user_model.dart';
import 'package:arishti_chatroom/network/auth_apis.dart';
import 'package:arishti_chatroom/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSpinner = false;
  String username = "";
  String password = "";

  void login() async {
    try {
      setState(() => showSpinner = true);

      User user = await AuthAPI.login(username, password, context);

      if (user != null) {
        setState(() => showSpinner = false);
        Navigator.pushReplacementNamed(context, Routes.homePage);
      }
    } catch (e) {
      debugPrint("Error logging in: $e");
      setState(() => showSpinner = false);
    }
  }

  final kLoginTextFieldDecoration = const InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  final kLoginTextFieldTextStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: kLoginTextFieldTextStyle,
                textAlign: TextAlign.center,
                onChanged: (value) => username = value,
                decoration: kLoginTextFieldDecoration.copyWith(
                  hintText: "Enter your email",
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: kLoginTextFieldTextStyle,
                onChanged: (value) => password = value,
                decoration: kLoginTextFieldDecoration.copyWith(
                  hintText: "Enter your password",
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                label: 'Log In',
                color: Colors.lightBlueAccent,
                onTap: login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
