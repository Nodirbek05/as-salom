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
  String? devicename;
  dynamic code;
  num? id;
  String? updatedat;
  String? createdat;
  UserModel({
    this.name,
    this.phone,
    this.devicename,
    this.code,
    this.id,
    this.updatedat,
    this.createdat,
  });

  UserModel copyWith({
    String? name,
    String? phone,
    String? devicename,
    dynamic code,
    num? id,
    String? updatedat,
    String? createdat,
  }) {
    return UserModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      devicename: devicename ?? this.devicename,
      code: code ?? this.code,
      id: id ?? this.id,
      updatedat: updatedat ?? this.updatedat,
      createdat: createdat ?? this.createdat,
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
    if (devicename != null) {
      result.addAll({'device_name': devicename});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (updatedat != null) {
      result.addAll({'updated_at': updatedat});
    }
    if (createdat != null) {
      result.addAll({'created_at': createdat});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      devicename: map['device_name'],
      code: map['code'],
      id: map['id'],
      updatedat: map['updated_at'],
      createdat: map['created_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, phone: $phone, device_name: $devicename, code: $code, id: $id, updated_at: $updatedat, created_at: $createdat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.phone == phone &&
        other.devicename == devicename &&
        other.code == code &&
        other.id == id &&
        other.updatedat == updatedat &&
        other.createdat == createdat;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        devicename.hashCode ^
        code.hashCode ^
        id.hashCode ^
        updatedat.hashCode ^
        createdat.hashCode;
  }
}
