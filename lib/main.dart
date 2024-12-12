import 'package:flutter/material.dart';
import 'package:pact_app_1/about_us_page.dart';
import 'home_page.dart';
import 'dart:developer';
import 'login_page.dart';
import 'settings_page.dart';
import 'notification_page.dart';
import 'data_privacy_page.dart';
import 'summary_page.dart';
import 'dart:async';
import 'my_apps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:pact_app_1/overlays/true_caller_overlay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrueCallerOverlay(message: "com.instagram.android"),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel("com.example.caker/overlay");

  @override
  void initState(){
    super.initState();
    _setUpMethodChannelListener();
  }

  void _setUpMethodChannelListener() {
    platform.setMethodCallHandler((call) async {
      if (call.method.isNotEmpty) {
        _showOverlay(call.method);
      }
    });
  }

  Future<void> _showOverlay(String cont) async {
    try {
      log(cont);
      final bool isGranted = await FlutterOverlayWindow.isPermissionGranted();
      if (!isGranted) {
        await FlutterOverlayWindow.requestPermission();
      }

      await FlutterOverlayWindow.showOverlay(
        /*
        enableDrag: false,
        overlayTitle: "Pact Overlay Active",
        overlayContent: 'showing summaries now',
        flag: OverlayFlag.defaultFlag,
        visibility: NotificationVisibility.visibilityPublic,
        positionGravity: PositionGravity.auto,
        // ignore: use_build_context_synchronously
        height: (MediaQuery.of(context).size.height * 2.0).toInt(),
        width: WindowSize.matchParent,
        startPosition: const OverlayPosition(0, 0),
        */
      );

      log("Overlay shown successfully");
    } catch (e) {
      log("Error showing overlay: $e");
    }
  }

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


