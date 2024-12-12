import 'package:flutter/material.dart';
import 'package:pact_app_1/about_us_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'notification_page.dart';
import 'data_privacy_page.dart';
import 'summary_page.dart';
import 'my_apps_page.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';



void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
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
        '/about_us': (context) => AboutUsPage(),
      },
    );
  }
}

