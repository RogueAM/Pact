import 'package:flutter/material.dart';
import 'home_page.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _notifyPolicyUpdates = false;
  bool _notifyAllUpdates = false;
  bool _notifyMajorUpdates = false;

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
              title: Text('Notify me of Policy Updates', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: _notifyPolicyUpdates,
                onChanged: (value) {
                  setState(() {
                    _notifyPolicyUpdates = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Notify me of All Updates', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: _notifyAllUpdates,
                onChanged: (value) {
                  setState(() {
                    _notifyAllUpdates = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Notify me of Major Updates', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: _notifyMajorUpdates,
                onChanged: (value) {
                  setState(() {
                    _notifyMajorUpdates = value;
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
