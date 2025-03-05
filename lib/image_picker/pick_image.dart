import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image Picker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PickImage(),
    );
  }
}

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {

  late XFile? photo = null;

  @override
  Widget build(BuildContext context) {

    final ImagePicker picker = ImagePicker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Column(
        children: [
          if (photo != null) Image.file(File(photo!.path)),
          ElevatedButton(
            onPressed: () async {
              photo = await picker.pickImage(source: ImageSource.camera);

              if (photo!= null) {
                setState(() {

                });
              }
            },
            child: const Text('Pick Image from Camera'),
          ),
        ],
      ),
    );
  }
}

