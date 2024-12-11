import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'notification_page.dart';
import 'data_privacy_page.dart';
import 'summary_page.dart';
import 'my_apps_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Add const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        '/settings': (context) => SettingsScreen(),
        '/notification': (context) => NotificationPage(),
        '/data_privacy': (context) => DataPrivacyPage(),
        '/summary': (context) => SummaryPage(),
      },
    );
  }
}

