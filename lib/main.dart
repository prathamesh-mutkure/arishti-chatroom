import 'package:arishti_chatroom/constants/app_theme.dart';
import 'package:arishti_chatroom/constants/routes.dart';
import 'package:arishti_chatroom/constants/strings.dart';
import 'package:arishti_chatroom/pages/HomePage.dart';
import 'package:arishti_chatroom/pages/WelcomePage.dart';
import 'package:arishti_chatroom/stores/message_store.dart';
import 'package:arishti_chatroom/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// flutter packages pub run build_runner build
// TODO: Add ENV
// TODO: Add Toasts
// TODO: Theming

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<MessageStore>(create: (_) => MessageStore()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: AppTheme.themeDataLight,
      routes: Routes.routes,
      home: context.watch<UserStore>().isLoggedIn
          ? const HomePage()
          : const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
