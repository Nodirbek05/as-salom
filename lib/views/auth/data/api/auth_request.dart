import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/auth/data/models/created_account_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRequests {
  AuthRequests._();
  static Future<ResponseData> createAccount(
      String name, String phone, String deviceName) async {
    try {
      print('${ApiPaths.basicUrl}${ApiPaths.register}');
      final response =
          await http.post(Uri.parse('${ApiPaths.basicUrl}${ApiPaths.register}'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode(
                {
                  'name': name,
                  'phone': "+998 ${phone.replaceAll("-", " ")}",
                  'device_name': deviceName,
                },
              ));
      print(response.body.toString() + "RESPONSE OF CREATEF");
      print(response.statusCode.toString() + "RESPONSE OF CREATEF");
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CreatedAccountModel.fromJson(response.body);
        case StatusCodes.alreadyTaken:
        case StatusCodes.alreadyTaken2:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<Object> login(String phone) async {
    // try {
    print('${ApiPaths.basicUrl}${ApiPaths.register}');
    final response =
        await http.post(Uri.parse('${ApiPaths.basicUrl}${ApiPaths.login}'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(
              {'phone': "+998 ${phone.replaceAll("-", " ")}"},
            ));
    print("LOGIN RESPONSE ${response.body}");
    switch (response.statusCode) {
      case StatusCodes.ok:
        return CreateAccountDataModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> verification(num code) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var token = _prefs.getString('token');
      final response = await http.post(
          Uri.parse('${ApiPaths.basicUrl}${ApiPaths.verification}'),
          headers: {
            'Authorization': "Bearer $token",
            'Content-Type': 'application/json'
          },
          body: json.encode(
            {'code': code},
          ));
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }
}
