import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:convert';


// add the dependancy : file_picker: ^5.0.0

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
  Uint8List? _imageBytes;
  String _imageSize = '';

  // Function to pick an image
  Future<void> _pickImage() async {
    // Open the file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.isNotEmpty) {
      // Get the selected file
      var file = result.files.first;
      int fileSizeInBytes = file.size;

      // Convert file size from bytes to KB or MB
      String size = '';
      if (fileSizeInBytes < 1024) {
        size = '${fileSizeInBytes}B'; // Bytes
      } else if (fileSizeInBytes < 1048576) {
        size = '${(fileSizeInBytes / 1024).toStringAsFixed(2)} KB'; // KB
      } else {
        size = '${(fileSizeInBytes / 1048576).toStringAsFixed(2)} MB'; // MB
      }

      // Read the image as bytes
      final bytes = file.bytes;
      setState(() {
        _imageBytes = bytes;
        _imageSize = size;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Image and Show Size (Web)'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display image and its size
            _imageBytes != null
                ? Column(
              children: [
                // Display the image using Image.memory since File is in Uint8List
                Image.memory(_imageBytes!, width: 200, height: 200),
                SizedBox(height: 10),
                Text('Size: $_imageSize', style: TextStyle(fontSize: 16)),
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
