import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import to launch the URL

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String author;
  final String publishedAt;
  final String sourceName;
  final String url; // Add URL field

  NewsDetailPage({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishedAt,
    required this.sourceName,
    required this.url, // Initialize URL field
  });

  // Function to launch the full article
  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              imageUrl.isNotEmpty
                  ? Image.network(imageUrl)
                  : SizedBox.shrink(),
              SizedBox(height: 10),
              Text(
                'By $author | Source: $sourceName',
                style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600]),
              ),
              SizedBox(height: 5),
              Text(
                'Published at: ${publishedAt.split("T")[0]}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Text(
                content.isNotEmpty ? content : 'Full content not available.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // Display a button to view the full article regardless of truncation markers
              ElevatedButton(
                onPressed: _launchURL,
                child: Text('Read Full Article'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
