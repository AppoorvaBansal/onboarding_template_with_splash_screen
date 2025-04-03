import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaPickerPage(),
    );
  }
}

class MediaPickerPage extends StatefulWidget {
  @override
  _MediaPickerPageState createState() => _MediaPickerPageState();
}

class _MediaPickerPageState extends State<MediaPickerPage> {
  File? _image;
  String _imageSize = '';

  // Function to pick an image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Get the selected image file
      File imageFile = File(pickedFile.path);

      // Get the image size (in bytes)
      int fileSize = await imageFile.length();

      // Convert file size from bytes to KB or MB
      String size = '';
      if (fileSize < 1024) {
        size = '${fileSize}B'; // Bytes
      } else if (fileSize < 1048576) {
        size = '${(fileSize / 1024).toStringAsFixed(2)} KB'; // KB
      } else {
        size = '${(fileSize / 1048576).toStringAsFixed(2)} MB'; // MB
      }

      setState(() {
        _image = imageFile;
        _imageSize = size;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Image and Show Size'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display image and its size
            _image != null
                ? Column(
              children: [
                Image.file(_image!, width: 200, height: 200), // Display image
                SizedBox(height: 10),
                Text('Size: $_imageSize', style: TextStyle(fontSize: 16)), // Display image size
              ],
            )
                : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick an Image'),
            ),
          ],
        ),
      ),
    );
  }
}
