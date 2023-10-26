import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/profile/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRequests {
  UserRequests._();

  static Future<ResponseData> getProfile() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var token = _prefs.getString('token');
      print('${ApiPaths.basicUrl}${ApiPaths.getUser}');
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getUser}'),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json'
        },
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return ProfileModel.fromJson(response.body);
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
