part of 'base_cubit.dart';

mixin BaseCubitMixin {
  final _navigationService = NavigationUtil.I;
  final _toastService = ToastMessageUtil.I;
  final _userDataService = UserDataUtil.I;
  final _imagePickerService = ImagePickerUtil.I;

  /// Navigation Service
  Future popPage<T extends Object?>([T? result]) async =>
      await _navigationService.popPage(result);

  replaceRoute(PageRouteInfo<dynamic> route) =>
      _navigationService.replaceRoute(route);

  pushRoute(PageRouteInfo<dynamic> route) =>
      _navigationService.pushRoute(route);

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
