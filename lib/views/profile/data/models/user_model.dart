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

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProfileModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProfileModel &&
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class UserDataModel {
  num? id;
  String? name;
  String? phone;
  String? code;
  String? role;
  String? is_active;
  String? device_name;
  String? created_at;
  String? updated_at;
  UserDataModel({
    this.id,
    this.name,
    this.phone,
    this.code,
    this.role,
    this.is_active,
    this.device_name,
    this.created_at,
    this.updated_at,
  });

  UserDataModel copyWith({
    num? id,
    String? name,
    String? phone,
    String? code,
    String? role,
    String? is_active,
    String? device_name,
    String? created_at,
    String? updated_at,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      code: code ?? this.code,
      role: role ?? this.role,
      is_active: is_active ?? this.is_active,
      device_name: device_name ?? this.device_name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(phone != null){
      result.addAll({'phone': phone});
    }
    if(code != null){
      result.addAll({'code': code});
    }
    if(role != null){
      result.addAll({'role': role});
    }
    if(is_active != null){
      result.addAll({'is_active': is_active});
    }
    if(device_name != null){
      result.addAll({'device_name': device_name});
    }
    if(created_at != null){
      result.addAll({'created_at': created_at});
    }
    if(updated_at != null){
      result.addAll({'updated_at': updated_at});
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
      is_active: map['is_active'],
      device_name: map['device_name'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDataModel(id: $id, name: $name, phone: $phone, code: $code, role: $role, is_active: $is_active, device_name: $device_name, created_at: $created_at, updated_at: $updated_at)';
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
      other.is_active == is_active &&
      other.device_name == device_name &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      code.hashCode ^
      role.hashCode ^
      is_active.hashCode ^
      device_name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
