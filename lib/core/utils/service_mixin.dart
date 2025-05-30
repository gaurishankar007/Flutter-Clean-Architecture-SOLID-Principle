import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/auth/domain/entities/user_data.dart';
import '../data/states/data_state.dart';
import '../services/image_picker/image_picker_service.dart';
import 'toast_util.dart';
import '../services/navigation/navigation_service.dart';
import '../services/session/session_service.dart';

mixin ServiceMixin {
  final _navigationService = NavigationUtil.I;
  final _sessionManager = SessionUtil.I;
  final _imagePickerService = ImagePickerUtil.I;

  /// Navigation Service
  Future popTop<T extends Object?>([T? result]) async =>
      await _navigationService.popTop(result);

  Future<void> replaceAllRoute(PageRouteInfo<dynamic> route) async =>
      await _navigationService.replaceAllRoute(route);

  Future<T?> pushRoute<T>(PageRouteInfo<dynamic> route) async =>
      await _navigationService.pushRoute(route);

  /// Toast Message Service
  showSuccessToast(String message) => ToastUtil.showSuccess(message);

  showErrorToast(String message) => ToastUtil.showError(message);

  showDataStateToast(DataState dataState, {String message = ""}) =>
      ToastUtil.showDataStateToast(dataState, message: message);

  /// User Data Service
  setUserData(UserData model) => _sessionManager.setUserData = model;

  /// Image Picker Service
  Future<String?> pickImage([ImageSource source = ImageSource.camera]) =>
      _imagePickerService.pickImage(source: source);
}
