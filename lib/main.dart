import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart'; // Import the onboarding screen
import 'package:avoid_it/Components/home.dart'; // Import the home screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avoid It',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(), // Start with the splash screen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("SharedPreferences loaded");

      bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;

      print("onboardingCompleted: $onboardingCompleted");

      // Navigate to the appropriate screen
      if (onboardingCompleted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()), // Go to home page if onboarding is completed
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => OnboardingScreen()), // Go to onboarding if not completed
        );
      }
    } catch (e) {
      print("Error in _checkOnboardingStatus: $e");
      // Handle error, show an error message if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Splash screen loader
      ),
    );
  }
}
