import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Color.fromARGB(255, 213, 111, 231), // Customize app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About the App Section
              Text(
                'About the App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'This app is designed  to further raises the awareness of boycott products.'
                'Products produces by organizations using their profits in funding the ammunition being utilized in wiping out a whole ethnicity, The Palestinians. and guide people in path of humanity. '
                'personalized user profiles. The app allows users to explore a variety of content and '
                'seamlessly navigate through various pages.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // About the Developers Section
              Text(
                'About the Developers',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Abdullahi Yuusuf and Adegoke Fatihat are Talented students with brilliant minds. '
                'They are the kind that push beyond boundary and are ready to make a positive impact in the world revolution'
                ' By rubbing minds together, they fabricate thrilling ideas and work to make it a reality.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Developers' Names (Optional)
              Text(
                'Tech Stack',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '- Abdullah Yusuf: A FullStack Developer Specialized in Frontend Development\n'
                '- Adegoke Fathiat: A UI/UX designer with experience in Photography and Video Editing',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
