import 'package:flutter/material.dart';

class MyAppsPage extends StatelessWidget {
  const MyAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of apps for demonstration
    final List<String> apps = [
      'Instagram',
      'Discord',
      'Amazon',
      'Daily Brief',
      'GPay',
      'Wallet',
      'Instapaper',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            'assets/Pact-Logo.jpeg',
            height: 50,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for apps...',
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.grey[800], // Same grey as home_page.dart
                filled: true,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Displaying apps in a grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of apps per row
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return _buildAppIcon(apps[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Navigate back to home page
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                // Navigate to settings page
              },
            ),
            IconButton(
              icon: const Icon(Icons.help_outline, color: Colors.white),
              onPressed: () {
                // Navigate to help/tutorial page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppIcon(String appName) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[800], // Icon background
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.apps, color: Colors.white), // Placeholder icon
        ),
        const SizedBox(height: 5),
        Text(
          appName,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
