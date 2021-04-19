import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  final ImageLabeler cloudLabeler = FirebaseVision.instance
      .cloudImageLabeler(CloudImageLabelerOptions(confidenceThreshold: 0.8));
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () {
            selectImage();
          },
          child: Text("Tap Me"),
        ),
      ),
    );
  }

  void selectImage() async {
    PickedFile selected =
        await imagePicker.getImage(source: ImageSource.camera);
    File image = File(selected.path);
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    List<ImageLabel> cloudLabels =
        await widget.cloudLabeler.processImage(visionImage);
    cloudLabels.forEach((element) {
      print(element.text);
    });
  }
}
