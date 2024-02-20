import 'package:flutter/material.dart';
import 'welcome.dart';
import 'mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoryWonder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        WebViewPage.routeName: (context) => const WebViewPage(),
      },
    );
  }
}
