import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:pact_app_1/boxes.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = 'AIzaSyCQSVf0lpHgZ7t_nUDdZdU-Fv3xcmAznwQ';

class TrueCallerOverlay extends StatefulWidget {
  final String message;

  const TrueCallerOverlay({super.key, required this.message});

  @override
  State<TrueCallerOverlay> createState() => _TrueCallerOverlayState();
}

class _TrueCallerOverlayState extends State<TrueCallerOverlay> {
  String story = '';
  bool isGold = true;

  final _goldColors = const [
    Color(0xFFa2790d),
    Color(0xFFebd197),
    Color(0xFFa2790d),
  ];

  final _silverColors = const [
    Color(0xFFAEB2B8),
    Color(0xFFC7C9CB),
    Color(0xFFD7D7D8),
    Color(0xFFAEB2B8),
  ];

  @override
  void initState() {
    super.initState();
    _getStory();
  }

  Future<void> _getStory() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final prompt = 'Write a story about a magic backpack.';
    final content = [Content.text(prompt)];

    try {
      final response = await model.generateContent(content);
      if (response.text != null) {
        setState(() {
          story = response.text!;
        });
      } else {
        // Handle case where the response does not contain text
        setState(() {
          story = 'Failed to generate story';
        });
      }
    } catch (e) {
      // Handle any exceptions that occur during the API call
      setState(() {
        story = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isGold ? _goldColors : _silverColors,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isGold = !isGold;
              });
              FlutterOverlayWindow.getOverlayPosition().then((value) {
                log("Overlay Position: $value");
              });
            },
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx16VdHh2dDEZKu6KDUCXcTmMfqWuPygi-0w&s"),
                          ),
                        ),
                      ),
                      title: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(widget.message),
                    ),
                    OrangeBoxWithText(text: story),
                    ListTile(
                      leading: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://cdn.discordapp.com/attachments/1167492825366138921/1316403808582242334/pacter.jpg?ex=675aec15&is=67599a95&hm=8014a8cb16c61fc53cd915a3792faf5dd75864806597bb3885072abd4e8880b3&"),
                          ),
                        ),
                      ),
                      title: const Text(
                        "Summary Policy",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("from Gemini"),
                    ),
                    const OrangeBoxWithText(text: """Your Info: Meta collects content, communications, and sensitive data you share.

Connections: Tracks your interactions with people, groups, and synced contacts.

Usage: Logs how you use features, view content, and interact with Products.

Transactions: Collects purchase details and data others share about you."""),
                    const TextRectangleGrid(texts: ["+ Tell me more", "+ Simpler", "+ What data?", "+ "]),
                    const Spacer(),
                    const Divider(color: Colors.black54),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Package Name: com.deez.nuts"),
                              Text("John Ligma"),
                            ],
                          ),
                          Text(
                            "Pact Privacy",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  child: IconButton(
                    onPressed: () async {
                      await FlutterOverlayWindow.closeOverlay();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
