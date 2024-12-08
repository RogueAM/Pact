import 'package:flutter/material.dart';
import 'home_page.dart';

class DataPrivacyPage extends StatefulWidget {
  @override
  _DataPrivacyPageState createState() => _DataPrivacyPageState();
}

class _DataPrivacyPageState extends State<DataPrivacyPage> {
  bool _shareDataWithPartners = false;
  bool _allowDataCollection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 150, // Increase this value as needed
        title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.remove_red_eye, size: 50, color: Colors.white), // Adjust size if needed
                SizedBox(height: 5),
                Text('Pact.', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Share Data with Partners', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: _shareDataWithPartners,
                onChanged: (value) {
                  setState(() {
                    _shareDataWithPartners = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Allow Data Collection', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: _allowDataCollection,
                onChanged: (value) {
                  setState(() {
                    _allowDataCollection = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline, color: Colors.white),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
      ),
    );
  }
}
