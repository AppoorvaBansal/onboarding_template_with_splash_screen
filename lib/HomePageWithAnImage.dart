import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Center Message and Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CenterMessageAndImage(),
    );
  }
}

class CenterMessageAndImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center Message and Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text Message
            Text(
              'Hello, Flutter!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Space between text and image
            // Image
            Image.network(
              'https://media0.giphy.com/media/A8T56uwdlmR698KmKe/giphy.gif', // Sample image URL
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
