import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

/// Image picker service class for picking single/multiple images
class ImagePickerService {
  /// Pick single image
  Future<String?> pickImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
  }) async {
    final xImage = await ImagePicker().pickImage(
      source: source,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      preferredCameraDevice: preferredCameraDevice,
      requestFullMetadata: requestFullMetadata,
    );

    if (xImage != null) {
      File image = File(xImage.path);
      return image.path;
    }

    return null;
  }
}

/// A util class for accessing [ImagePickerService]
class ImagePickerUtil {
  ImagePickerUtil._();

  /// Returns the registered instance of [ImagePickerService] which is always the same
  static ImagePickerService get I => GetIt.I<ImagePickerService>();
}
