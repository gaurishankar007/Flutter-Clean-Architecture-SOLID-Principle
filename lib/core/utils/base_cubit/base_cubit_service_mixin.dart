import 'package:image_picker/image_picker.dart';

import '../../../features/auth/domain/entities/user_data.dart';
import '../../data/states/data_state.dart';
import '../../services/image_picker/image_picker_service.dart';
import '../../services/message/toast_message_service.dart';
import '../../services/navigation/navigation_service.dart';
import '../../services/user_data_service.dart';

mixin BaseCubitServiceMixin {
  final _navigationServiceService = NavigationUtil.I;
  final _toastService = ToastMessageUtil.I;
  final _userDataService = UserDataUtil.I;
  final _imagePickerService = ImagePickerUtil.I;

  /// Navigation Service
  Future popPage<T extends Object?>([T? result]) async =>
      await _navigationServiceService.popPage(result);

  replaceRoute(String path, {dynamic argument}) =>
      _navigationServiceService.replaceRoute(path, argument: argument);

  pushRoute(String path, {dynamic argument}) =>
      _navigationServiceService.pushRoute(path, argument: argument);

  /// Toast Message Service
  showSuccessToast(String message) => _toastService.showSuccess(message);

  showErrorToast(String message) => _toastService.showError(message);

  showDataStateToast(DataState dataState, {String message = ""}) =>
      _toastService.showDataStateToast(dataState, message: message);

  /// User Data Service
  setUserData(UserData model) => _userDataService.setUserData = model;

  /// Image Picker Service
  Future<String?> pickImage([ImageSource source = ImageSource.camera]) =>
      _imagePickerService.pickImage(source: source);
}
