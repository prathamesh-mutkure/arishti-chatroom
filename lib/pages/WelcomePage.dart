import 'package:arishti_chatroom/constants/routes.dart';
import 'package:arishti_chatroom/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedButton(
              label: 'Log In',
              // onTap: () => Navigator.pushNamed(context, Routes.loginPage),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.loginPage,
              ),
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              label: 'Register',
              onTap: () => Navigator.pushNamed(
                context,
                Routes.registrationPage,
              ),
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
