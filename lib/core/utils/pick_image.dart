import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String?> pickImage() async {
  String? path;
  final xImage = await ImagePicker().pickImage(source: ImageSource.camera);

  if (xImage != null) {
    File image = File(xImage.path);
    path = image.path;
  }

  return path;
}
