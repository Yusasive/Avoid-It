import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avoid_it/Components/home.dart'; // Import the home page

void main() => runApp(OnboardingApp());

class OnboardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            onLastPage = index == 2; // Assuming there are 3 pages
          });
        },
        children: [
          buildOnboardingPage(
              color: Colors.purple,
              imagePath: 'assets/onboarding_1.jfif',
              title: 'Welcome to App!',
              description:
                  'Islamic Boycott Product Detection and Alternative Suggestion App named \"Avoid It\"'),
          buildOnboardingPage(
              color: Colors.purple,
              imagePath: 'assets/onboarding_2.png',
              title: 'App Purpose',
              description:
                  'The purpose of this project is to create a mobile application that allows users to identify products that are boycotted in Islam, particularly focusing on products related to Palestine, and provide ethical alternatives'),
          buildOnboardingPage(
              color: Colors.purple,
              imagePath: 'assets/onboarding_3.jfif',
              title: 'Get Started',
              description: 'Lets get started'),
        ],
      ),
      bottomSheet: onLastPage
          ? Container(
              height: 60,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('onboardingCompleted', true); // Mark onboarding as completed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()), // Direct to home page
                  );
                },
                child: Text("Get Started", style: TextStyle(fontSize: 18)),
              ),
            )
          : Container(
              height: 60,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,  // Arrow background color
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
    );
  }

  Widget buildOnboardingPage({
    required Color color,
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
