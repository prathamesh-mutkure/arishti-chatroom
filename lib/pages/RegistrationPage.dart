import 'package:arishti_chatroom/constants/routes.dart';
import 'package:arishti_chatroom/constants/strings.dart';
import 'package:arishti_chatroom/constants/styles.dart';
import 'package:arishti_chatroom/models/user_model.dart';
import 'package:arishti_chatroom/network/auth_apis.dart';
import 'package:arishti_chatroom/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showSpinner = false;
  String username = "";
  String password = "";

  void register() async {
    try {
      setState(() => showSpinner = true);

      User? user = await AuthAPI.register(username, password, context);

      if (user != null) {
        setState(() => showSpinner = false);

        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homePage,
          (route) => false,
        );

        setState(() => showSpinner = false);
      }
    } catch (err) {
      debugPrint("Error registering: $err");
      EasyLoading.showToast("Error registering: $err");
      setState(() => showSpinner = false);
    }
  }

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
            children: <Widget>[
              TextField(
                style: Styles.loginTextFieldTextStyle,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => username = value,
                decoration: Styles.loginTextFieldDecoration.copyWith(
                  hintText: Strings.usernameField,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                style: Styles.loginTextFieldTextStyle,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) => password = value,
                decoration: Styles.loginTextFieldDecoration.copyWith(
                  hintText: Strings.passwordField,
                ),
              ),
              const SizedBox(height: 24.0),
              RoundedButton(
                label: Strings.registerButton,
                onTap: register,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
