import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/auth/data/models/created_account_model.dart';
import 'package:http/http.dart' as http;

class AuthRequests {
  AuthRequests._();
  static Future<ResponseData> createAccount(
      String name, String phone, String deviceName) async {
    try {
      final response =
          await http.post(Uri.parse('${ApiPaths.basicUrl}${ApiPaths.register}'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode(
                {
                  "name": name,
                  "phone": phone,
                  "device_name ": deviceName,
                },
              ));
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CreatedAccountModel.fromJson(response.body);
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
