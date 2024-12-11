import 'package:flutter/services.dart'; // Import for SystemNavigator
import 'package:flutter/material.dart';
import 'summarizer_page.dart';
import 'settings_page.dart';
import 'my_apps_page.dart';
import 'dictionary_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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

  Future<bool> _onWillPop() async {
    SystemNavigator.pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                  Image.asset('assets/Pact-Logo.jpeg', height: 100),
                  SizedBox(height: 5),
                  Text(
                    'Pact.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Pact.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your apps',
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.grey[800],
                    filled: true,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconButton(context, 'My Apps', Icons.apps, MyAppsPage()),
                    _buildIconButton(context, 'Summarizer', Icons.text_snippet, SummarizerPage()),
                    _buildIconButton(context, 'Dictionary', Icons.book, DictionaryPage()),
                  ],
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
      ),
    );
  }

  Widget _buildIconButton(
      BuildContext context, String label, IconData icon, Widget? page) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 50, color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
