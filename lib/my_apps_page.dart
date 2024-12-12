import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class MyAppsPage extends StatefulWidget {
  const MyAppsPage({super.key});

  @override
  State<MyAppsPage> createState() => _MyAppsPageState();
}

void main() async {
  final model = GenerativeModel(
      apiKey: 'AIzaSyBhwp2mdMXT04FoB_wqWogoJ57UtOxvR7M',
      model: 'gemini-1.5-flash-latest'
  );

  final prompt = 'hello';
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);

  print(response.text);
}
/*Future<String> _fetchPrivacyPolicy(String packageName) async {
  // Replace with actual implementation using the google_generative_ai package
  // or Firebase Vertex AI to call the Gemini API with the package name
  // and retrieve the privacy policy content.

  // Example using Google Generative AI:
  final model = TextGenerationModel(apiKey: 'AIzaSyBhwp2mdMXT04FoB_wqWogoJ57UtOxvR7M');
  final prompt = "What is the privacy policy of the app with package name '$packageName'?";
  final response = await model.generate(prompt: prompt);
  return response.text;
}

Future<String> _summarizePrivacyPolicy(String privacyPolicy) async {
  // Replace with actual implementation using the google_generative_ai package
  // or Firebase Vertex AI to call the Gemini API with the privacy policy text
  // and retrieve a summarized version.

  // Example using Google Generative AI:
  final model = TextGenerationModel(apiKey: 'AIzaSyBhwp2mdMXT04FoB_wqWogoJ57UtOxvR7M');
  final prompt = "Summarize this privacy policy: " + privacyPolicy;
  final response = await model.generate(prompt: prompt);
  return response.text;
} */

class _MyAppsPageState extends State<MyAppsPage> {
  String searchText = '';
  List<AppInfo> installedApps = [];

  @override
  void initState() {
    super.initState();
    _fetchInstalledApps();
  }

  Future<void> _fetchInstalledApps() async {
    final apps = await InstalledApps.getInstalledApps(true, true);
    setState(() {
      installedApps = apps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 150,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Pact-Logo.jpeg',
                height: 75,
              ),
              SizedBox(height: 5),
              Text('Pact.', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for apps...',
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.grey[800],
                filled: true,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
             Expanded(
              child: ListView.builder(
                itemCount: installedApps.length,
                itemBuilder: (context, index) {
                  final app = installedApps[index];
                  if (app.name.toLowerCase().contains(searchText.toLowerCase())) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: app.icon != null
                            ? Image.memory(app.icon!)
                            : Icon(Icons.error),
                      ),
                      title: Text(app.name),
                      subtitle: Text(app.getVersionInfo()),
                      /* onTap: () async {
                        final packageName = app.packageName;
                        String privacyPolicy = await _fetchPrivacyPolicy(packageName);
                        String summary = await _summarizePrivacyPolicy(privacyPolicy);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyPolicyScreen(
                              packageName: packageName,
                              privacyPolicy: privacyPolicy,
                              summary: summary,
                            ),
                          ),
                        );
                      }, */
                    );
                  } else {
                    return Container();
                  }
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
                Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
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
}

class PrivacyPolicyScreen extends StatelessWidget {
  final String packageName;
  final String privacyPolicy;
  final String summary;

  const PrivacyPolicyScreen({
    Key? key,
    required this.packageName,
    required this.privacyPolicy,
    required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy for $packageName'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Original Privacy Policy:', style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 10.0),
              Text(privacyPolicy),
              SizedBox(height: 20.0),
              Text('Summary:', style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 10.0),
              Text(summary),
            ],
          ),
        ),
      ),
    );
  }
}