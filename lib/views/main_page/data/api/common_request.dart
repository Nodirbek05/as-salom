import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/data/models/get_all_banners.dart';
import 'package:http/http.dart' as http;

class CommonRequests {
  CommonRequests._();
  static Future<ResponseData> createAccount(
      String name, String phone, String deviceName) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getBanners}'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return GetAllBanners.fromJson(response.body);
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getCategories}'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CategoriesModel.fromJson(response.body);
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
