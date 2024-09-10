import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'news_detail_page.dart';

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  List articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final String apiKey = '4a04afe206ea4d26b8d4c636cdc5bdc0';
    final String url = 'https://newsapi.org/v2/everything?q=Palestine&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          articles = data['articles'];
        });
      } else {
        print('Error fetching news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Muslim News Feed - Palestine'),
        backgroundColor: const Color.fromARGB(255, 213, 111, 231),
      ),
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Round image on the left
                            article['urlToImage'] != null
                                ? ClipOval(
                                    child: Image.network(
                                      article['urlToImage'],
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipOval(
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.image,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            SizedBox(width: 10), // Space between image and text
                            // Title and truncated content on the right
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article['title'] ?? 'No Title',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    article['description'] ?? 'No Description',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Truncated content displayed in the next paragraph
                        Text(
                          article['content'] != null && article['content'].length > 100
                              ? article['content'].substring(0, 100) + '...'
                              : article['content'] ?? 'No Content Available',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        // Button to navigate to detailed news page
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailPage(
                                    title: article['title'] ?? 'No Title',
                                    description: article['description'] ?? 'No Description',
                                    content: article['content'] ?? 'Full content not available.',
                                    imageUrl: article['urlToImage'] ?? '',
                                    author: article['author'] ?? 'Unknown',
                                    publishedAt: article['publishedAt'] ?? '',
                                    sourceName: article['source']['name'] ?? 'Unknown Source',
                                    url: article['url'] ?? '',
                                  ),
                                ),
                              );
                            },
                            child: Text('Read More'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
