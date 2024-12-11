import 'package:flutter/material.dart';
import 'home_page.dart';

class DictionaryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 150,  // Adjust as needed
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.remove_red_eye, size: 50, color: Colors.white), // Bigger icon
              SizedBox(height: 5),
              Text('Pact.', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dictionary', style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter word to look up',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for looking up the word
              },
              child: Text('Look Up'),
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
            Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
          } else if (index == 1) {
            Navigator.pushNamedAndRemoveUntil(context, '/settings', (route) => false);
          }
        },
      ),
    );
  }
}
