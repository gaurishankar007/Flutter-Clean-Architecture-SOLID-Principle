import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class ImagePickerService {
  Future<String?> pickImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
  });
}

@module
abstract class ImagePickerServiceModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}

/// Image picker service class for picking single/multiple images
@LazySingleton(as: ImagePickerService)
class ImagePickerServiceImplementation implements ImagePickerService {
  final ImagePicker _imagePicker;

  const ImagePickerServiceImplementation({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  /// Pick single image
  @override
  Future<String?> pickImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
  }) async {
    final xImage = await _imagePicker.pickImage(
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
