import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';

class ProfileModel extends ResponseData {
  UserDataModel data;
  ProfileModel({
    required this.data,
  });

  ProfileModel copyWith({
    UserDataModel? data,
  }) {
    return ProfileModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.toMap()});

    return result;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      data: UserDataModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProfileModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class UserDataModel {
  num? id;
  String? name;
  String? phone;
  dynamic code;
  dynamic role;
  dynamic isactive;
  String? devicename;
  String? createdat;
  String? updatedat;
  UserDataModel({
    this.id,
    this.name,
    this.phone,
    this.code,
    this.role,
    this.isactive,
    this.devicename,
    this.createdat,
    this.updatedat,
  });

  UserDataModel copyWith({
    num? id,
    String? name,
    String? phone,
    dynamic code,
    dynamic role,
    dynamic isactive,
    String? devicename,
    String? createdat,
    String? updatedat,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      code: code ?? this.code,
      role: role ?? this.role,
      isactive: isactive ?? this.isactive,
      devicename: devicename ?? this.devicename,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    if (role != null) {
      result.addAll({'role': role});
    }
    if (isactive != null) {
      result.addAll({'is_active': isactive});
    }
    if (devicename != null) {
      result.addAll({'device_name': devicename});
    }
    if (createdat != null) {
      result.addAll({'created_at': createdat});
    }
    if (updatedat != null) {
      result.addAll({'updated_at': updatedat});
    }

    return result;
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      code: map['code'],
      role: map['role'],
      isactive: map['is_active'],
      devicename: map['device_name'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDataModel(id: $id, name: $name, phone: $phone, code: $code, role: $role, is_active: $isactive, device_name: $devicename, created_at: $createdat, updated_at: $updatedat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDataModel &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.code == code &&
        other.role == role &&
        other.isactive == isactive &&
        other.devicename == devicename &&
        other.createdat == createdat &&
        other.updatedat == updatedat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        code.hashCode ^
        role.hashCode ^
        isactive.hashCode ^
        devicename.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode;
  }
}
