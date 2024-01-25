import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/profile/data/models/get_order_model.dart';
import 'package:assalomproject/views/profile/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRequests {
  UserRequests._();

  static Future<ResponseData> getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      // print('${ApiPaths.basicUrl}${ApiPaths.getUser}');
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getUser}'),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json'
        },
      );
      // print(response.body);
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

  static Future<ResponseData> updateName(String name, num userId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.patch(
          Uri.parse('${ApiPaths.basicUrl}${ApiPaths.updateName}/$userId'),
          headers: {
            'Authorization': "Bearer $token",
            'Content-Type': 'application/json'
          },
          body: json.encode(
            {'name': name},
          ));
      // print(response.body);
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

  static Future<ResponseData> updatePhone(String number, num userId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.patch(
          Uri.parse('${ApiPaths.basicUrl}${ApiPaths.updateNumber}/$userId'),
          headers: {
            'Authorization': "Bearer $token",
            'Content-Type': 'application/json'
          },
          body: json.encode(
            {'phone': "+998 ${number.replaceAll("-", " ")}"},
          ));
      // print(response.body);
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

  static Future<ResponseData> getOrders() async {
    // try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getOrders}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
    // print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return OrdersModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }
}
