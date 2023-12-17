// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_data_entity.dart';

part 'user_data_model.freezed.dart';

@freezed
class UserDataModel extends UserData with _$UserDataModel {
  const factory UserDataModel({
    required String accessToken,
    required String refreshToken,
    required int userId,
    required String userName,
    required int userGroupId,
    required String userGroupName,
    required int retailerId,
    required String retailerName,
    required int distributerId,
    required String distributerName,
    required UserType userType,
  }) = _UserDataModel;

  factory UserDataModel.empty() => UserDataModel(
        accessToken: "",
        refreshToken: "",
        userId: 0,
        userName: "",
        userGroupId: 0,
        userGroupName: "",
        retailerId: 0,
        retailerName: "",
        distributerId: 0,
        distributerName: "",
        userType: UserType.none,
      );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);
}

_$UserDataModelImpl _$$UserDataModelImplFromJson(Map<String, dynamic> json) {
  UserType userType = UserType.none;
  List userGroup = json["user_group"] as List;
  String retailerName = json["retailer_name"] ?? "";
  String distributerName = json["distributor_name"] ?? "";

  if (userGroup.isEmpty) {
    userType = UserType.admin;
  } else if (retailerName.isNotEmpty) {
    userType = UserType.retailer;
  } else if (distributerName.isNotEmpty) {
    userType = UserType.distributor;
  }

  return _$UserDataModelImpl(
    accessToken: json["access"],
    refreshToken: json["refresh"],
    userId: json["user_id"],
    userName: json["username"],
    userGroupId: userGroup.isEmpty ? 0 : userGroup[0]["id"],
    userGroupName: userGroup.isEmpty ? "" : userGroup[0]["name"],
    retailerId: json["retailer_id"] ?? 0,
    retailerName: retailerName,
    distributerId: json["distributor_id"] ?? 0,
    distributerName: distributerName,
    userType: userType,
  );
}

Map<String, dynamic> _$$UserDataModelImplToJson(_$UserDataModelImpl instance) {
  List userGroup = [];

  if (instance.userGroupId != 0 && instance.userGroupName != "") {
    userGroup.add({
      "id": instance.userGroupId,
      "name": instance.userGroupName,
    });
  }

  return {
    "refresh": instance.refreshToken,
    "access": instance.accessToken,
    "user_id": instance.userId,
    "username": instance.userGroupName,
    "user_group": userGroup,
    "retailer_id": instance.retailerId,
    "retailer_name": instance.retailerName,
    "distributor_id": instance.distributerId,
    "distributor_name": instance.distributerName,
    "user_type": instance.userType.name,
  };
}
