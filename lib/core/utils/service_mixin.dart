import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/auth/domain/entities/user_data.dart';
import '../data/states/data_state.dart';
import '../services/image_picker/image_picker_service.dart';
import '../services/message/toast_message_service.dart';
import '../services/navigation/navigation_service.dart';
import '../services/session/session_manager.dart';

mixin ServiceMixin {
  final _navigationService = NavigationUtil.I;
  final _toastService = ToastMessageUtil.I;
  final _sessionManager = SessionManagerUtil.I;
  final _imagePickerService = ImagePickerUtil.I;

  /// Navigation Service
  Future popPage<T extends Object?>([T? result]) async =>
      await _navigationService.popPage(result);

  replaceAllRoute(PageRouteInfo<dynamic> route) =>
      _navigationService.replaceAllRoute(route);

  pushRoute(PageRouteInfo<dynamic> route) =>
      _navigationService.pushRoute(route);

  /// Toast Message Service
  showSuccessToast(String message) => _toastService.showSuccess(message);

  showErrorToast(String message) => _toastService.showError(message);

  showDataStateToast(DataState dataState, {String message = ""}) =>
      _toastService.showDataStateToast(dataState, message: message);

  /// User Data Service
  setUserData(UserData model) => _sessionManager.setUserData = model;

  /// Image Picker Service
  Future<String?> pickImage([ImageSource source = ImageSource.camera]) =>
      _imagePickerService.pickImage(source: source);
}
