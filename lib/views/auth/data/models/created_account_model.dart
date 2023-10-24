import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';

class CreatedAccountModel extends ResponseData {
  CreateAccountDataModel data;
  CreatedAccountModel({
    required this.data,
  });

  CreatedAccountModel copyWith({
    CreateAccountDataModel? data,
  }) {
    return CreatedAccountModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'data': data.toMap()});
  
    return result;
  }

  factory CreatedAccountModel.fromMap(Map<String, dynamic> map) {
    return CreatedAccountModel(
      data: CreateAccountDataModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatedAccountModel.fromJson(String source) => CreatedAccountModel.fromMap(json.decode(source));

  @override
  String toString() => 'CreatedAccountModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreatedAccountModel &&
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class CreateAccountDataModel {
  UserModel? user;
  String token;
  CreateAccountDataModel({
    this.user,
    required this.token,
  });
  

  CreateAccountDataModel copyWith({
    UserModel? user,
    String? token,
  }) {
    return CreateAccountDataModel(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(user != null){
      result.addAll({'user': user!.toMap()});
    }
    result.addAll({'token': token});
  
    return result;
  }

  factory CreateAccountDataModel.fromMap(Map<String, dynamic> map) {
    return CreateAccountDataModel(
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateAccountDataModel.fromJson(String source) => CreateAccountDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'CreateAccountDataModel(user: $user, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreateAccountDataModel &&
      other.user == user &&
      other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}

class UserModel {
  String? name;
  String? phone;
  String? device_name;
  dynamic code;
  num? id;
  String? updated_at;
  String? created_at;
  UserModel({
    this.name,
    this.phone,
    this.device_name,
    this.code,
    this.id,
    this.updated_at,
    this.created_at,
  });

  UserModel copyWith({
    String? name,
    String? phone,
    String? device_name,
    dynamic code,
    num? id,
    String? updated_at,
    String? created_at,
  }) {
    return UserModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      device_name: device_name ?? this.device_name,
      code: code ?? this.code,
      id: id ?? this.id,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (device_name != null) {
      result.addAll({'device_name': device_name});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (updated_at != null) {
      result.addAll({'updated_at': updated_at});
    }
    if (created_at != null) {
      result.addAll({'created_at': created_at});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      device_name: map['device_name'],
      code: map['code'],
      id: map['id'],
      updated_at: map['updated_at'],
      created_at: map['created_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, phone: $phone, device_name: $device_name, code: $code, id: $id, updated_at: $updated_at, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.phone == phone &&
        other.device_name == device_name &&
        other.code == code &&
        other.id == id &&
        other.updated_at == updated_at &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        device_name.hashCode ^
        code.hashCode ^
        id.hashCode ^
        updated_at.hashCode ^
        created_at.hashCode;
  }
}
