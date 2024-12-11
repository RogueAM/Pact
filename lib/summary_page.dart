import 'package:flutter/material.dart';
import 'home_page.dart';

class SummaryPage extends StatefulWidget {
  static const routeName = '/summary';

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  bool _receiveWeeklySummary = false;

  int _selectedIndex = 1;  // Default to settings since it's a settings subpage

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
    } else if (index == 1) {
      Navigator.pushNamedAndRemoveUntil(context, '/settings', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 150,
        title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.remove_red_eye, size: 50, color: Colors.white),
                SizedBox(height: 5),
                Text('Pact.', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView to make content scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Receive Weekly Summary', style: TextStyle(color: Colors.white)),
                trailing: Switch(
                  value: _receiveWeeklySummary,
                  onChanged: (value) {
                    setState(() {
                      _receiveWeeklySummary = value;
                    });
                  },
                ),
              ),
            ],
          ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
