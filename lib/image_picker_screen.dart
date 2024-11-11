import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  dynamic selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Image Picker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImage == null
                ? SizedBox()
                : Container(
                    height: 200.0,
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: FileImage(selectedImage)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
            ElevatedButton(
                onPressed: () async {
                  final picker = ImagePicker();

                  final pickImage =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickImage != null) {
                    File pickFile = File(pickImage.path);
                    setState(() {
                      selectedImage = pickFile;
                    });
                  } else {
                    print("Empty");
                  }
                },
                child: const Text('Pick Image')),
          ],
        ),
      ),
    );
  }
}
