import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  const ImagePickerHelper._();
  static Future<File?> selectImage() async {
    try {
      final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      return File(file!.path);
    } on PlatformException catch (e) {
      debugPrint('$e: Image Selector Failed to Pick Image');
    }
  }
}
