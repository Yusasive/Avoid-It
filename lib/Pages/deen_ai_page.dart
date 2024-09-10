import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeenAIPage extends StatefulWidget {
  @override
  _DeenAIPageState createState() => _DeenAIPageState();
}

class _DeenAIPageState extends State<DeenAIPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> chatHistory = [];
  bool _isLoading = false;

  // Function to send the user's query to the Gemini API (instead of OpenAI)
  Future<void> sendQuery(String question) async {
    setState(() {
      _isLoading = true;
      chatHistory.add({"user": question});  // Add user's query to chat history
    });

    final apiKey = 'AIzaSyAR5E-4Dr9e20F8WpYW1pqklrwIiRy7OFc';  // Replace with your Gemini API Key
    final url = Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=$apiKey');  // Replace with the actual Gemini API endpoint

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'prompt': question,
      'context': 'You are an Islamic knowledge AI. Answer questions based on Islamic teachings and provide relevant Quranic references where applicable.',
      'model': 'gemini-model-name',  // Replace with the correct Gemini model name
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String aiResponse = data['response'] ?? "No response from AI.";  // Adjust according to Gemini response format
        setState(() {
          chatHistory.add({"bot": aiResponse});  // Add AI's response to chat history
        });
      } else {
        setState(() {
          chatHistory.add({"bot": "Error: ${response.statusCode}. ${response.body}"});
        });
      }
    } catch (e) {
      setState(() {
        chatHistory.add({"bot": "Failed to fetch the response: $e"});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to fetch a Quranic verse dynamically based on the user's question
  Future<void> fetchQuranVerse(int ayahNumber) async {
    final url = Uri.parse('https://api.alquran.cloud/v1/ayah/$ayahNumber/en.asad');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String verseText = data['data']['text'];
        setState(() {
          chatHistory.add({"bot": "Quran Verse: $verseText"});  // Display Quran verse in chat history
        });
      } else {
        setState(() {
          chatHistory.add({"bot": "Error: ${response.statusCode}. ${response.body}"});
        });
      }
    } catch (e) {
      setState(() {
        chatHistory.add({"bot": "Failed to fetch the verse: $e"});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deen AI Chatbox"),
        backgroundColor: Color.fromARGB(255, 213, 111, 231),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatHistory.length,
                itemBuilder: (context, index) {
                  final message = chatHistory[index];
                  final isUser = message.containsKey("user");
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isUser ? const Color.fromARGB(255, 206, 91, 226) : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        isUser ? message['user']! : message['bot']!,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Ask a question about Halal/Haram",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),  // Add some space between the input and the button
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      sendQuery(_controller.text);
                      // Optionally, you can fetch a Quranic verse dynamically.
                      // fetchQuranVerse(2);  // Fetch example verse (Surah Baqarah, Ayah 2)
                      _controller.clear();
                    }
                  },
                  child: Text("Ask"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
