import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:avoid_it/Pages/about_page.dart';
import 'package:avoid_it/Pages/deen_ai_page.dart';
import 'package:avoid_it/Pages/home_page.dart';
import 'package:avoid_it/Pages/newsfeed_page.dart';
import 'package:avoid_it/Pages/feedback.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    NewsFeedPage(),
    DeenAIPage(),
    AboutPage(),
    FeedbackPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Avoid It',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: const Duration(milliseconds: 500),
        animationCurve: Curves.easeIn,
        buttonBackgroundColor: Colors.purple,
        backgroundColor: Colors.white,
        color: Colors.purple,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.newspaper, color: Colors.white),
          Icon(Icons.chat, color: Colors.white),
          Icon(Icons.info, color: Colors.white),
          Icon(Icons.send, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
