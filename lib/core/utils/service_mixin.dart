import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';

import '../../ui/core/utils/toast_util.dart';
import '../../ui/features/auth/domain/entities/user_data.dart';
import '../data_states/data_state.dart';
import '../services/image_picker/image_picker_service.dart';
import '../services/navigation/navigation_service.dart';
import '../services/session/session_service.dart';

mixin ServiceMixin {
  final _navigationService = NavigationUtil.I;
  final _sessionService = SessionUtil.I;
  final _imagePickerService = ImagePickerUtil.I;

  /// Navigation Service
  Future popTop<T extends Object?>([T? result]) async =>
      await _navigationService.maybePopTop(result);

  Future<void> replaceAllRoute(PageRouteInfo<dynamic> route) async =>
      await _navigationService.replaceAllRoute(route);

  Future<T?> pushRoute<T>(PageRouteInfo<dynamic> route) async =>
      await _navigationService.pushRoute(route);

  /// Toast Message Service
  void showSuccessToast(String message) => ToastUtil.showSuccess(message);

  void showErrorToast(String message) => ToastUtil.showError(message);

  void showDataStateToast(DataState dataState, {String message = ""}) =>
      ToastUtil.showMessage(dataState, message: message);

  /// User Data Service
  void setUserData(UserData model) => _sessionService.setUserData = model;

  /// Image Picker Service
  Future<String?> pickImage([ImageSource source = ImageSource.camera]) =>
      _imagePickerService.pickImage(source: source);
}
