import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/data/models/get_all_banners.dart';
import 'package:assalomproject/views/main_page/data/models/get_sub_banner.dart';
import 'package:assalomproject/views/main_page/data/models/search_model.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommonRequests {
  CommonRequests._();
  static Future<ResponseData> getBanners() async {
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

   static Future<ResponseData> getSubBanners() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getSubBanners}'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return GetSubBannersModel.fromJson(response.body);
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
    // try {
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
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> getSpesificProducts() async {
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getSelection}'),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return SpesificProductsModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> getSubcategories() async {
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getSubCategories}'),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return SubcategoriesMainModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> searchProducts(String query) async {
    // try {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    final response =
        await http.post(Uri.parse('${ApiPaths.basicUrl}${ApiPaths.search}'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(
              {'search_text': query},
            ));
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return SearchModel.fromJson(response.body);
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
