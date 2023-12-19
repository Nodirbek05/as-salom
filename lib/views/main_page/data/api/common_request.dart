import 'dart:convert';

import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/error_response.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/common_models/zone_models.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/basket/data/models/create_order_model.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/data/models/category_inner_model.dart';
import 'package:assalomproject/views/main_page/data/models/confirm_order_by_card_model.dart';
import 'package:assalomproject/views/main_page/data/models/created_order_model.dart';
import 'package:assalomproject/views/main_page/data/models/filter_model.dart';
import 'package:assalomproject/views/main_page/data/models/get_all_banners.dart';
import 'package:assalomproject/views/main_page/data/models/get_sub_banner.dart';
import 'package:assalomproject/views/main_page/data/models/inner_model.dart';
import 'package:assalomproject/views/main_page/data/models/payment_types_model.dart';
import 'package:assalomproject/views/main_page/data/models/search_model.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:assalomproject/views/main_page/data/models/sub_category_inner_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommonRequests {
  CommonRequests._();
  static Future<ResponseData> getBanners() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    int place = _prefs.getInt("place") ?? 0;
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getBanners}/$place'),
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int place = _prefs.getInt("place") ?? 0;
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getSubBanners}/$place'),
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int place = _prefs.getInt("place") ?? 0;
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getCategories}/$place'),
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

  static Future<ResponseData> getAllCategories() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int place = _prefs.getInt("place") ?? 0;
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getAllCategories}/$place'),
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

  static Future<Object> getInsideCategories(int id) async {
    print(id);
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.insideCat}$id'),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return CategoryInnerModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> getCatProducts(int id) async {
    print(id);
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.insideCat}$id'),
      headers: {'Content-Type': 'application/json'},
    );
    print("RESPONSE DATA ${response.body}");
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return SubCategoryModelMain.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> getInnerProducts(int id) async {
    print(id);
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.subCategoryInner}$id'),
      headers: {'Content-Type': 'application/json'},
    );
    print("SUBCATEGORY RESPONSE DATA ${response.body}");
    switch (response.statusCode) {
      case StatusCodes.ok:
        return InnerModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> filterCat(int id) async {
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.filter}/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return FilterModel.fromJson(response.body);
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int place = _prefs.getInt("place") ?? 0;
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getSelection}/$place'),
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int place = _prefs.getInt("place") ?? 0;
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getSubCategories}/$place'),
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
    // SharedPreferences _prefs = await SharedPreferences.getInstance();
    // var token = _prefs.getString('token');
    final response =
        await http.post(Uri.parse('${ApiPaths.basicUrl}${ApiPaths.search}'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(
              {'search_text': query},
            ));
    print(response.body);
    print(response.statusCode);
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

  static Future<ResponseData> createOrder(CreateOrderModel order) async {
    // try {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    var list = [];
    var sizes = [];

    for (var i = 0; i < order.goods.length; i++) {
      for (var a = 0; a < order.goods[i].sizes!.length; a++) {
        Map<String, dynamic> size = {
          "size_id": order.goods[i].sizes![a].sizeId,
          "quantity": order.goods[i].sizes![a].qty
        };
        sizes.add(size);
      }
      Map<String, dynamic> data = {
        "good_id": order.goods[i].goodId,
        "quantity": order.goods[i].qty,
        "weight": order.goods[i].weight,
        "sizes": sizes
      };
      list.add(data);
    }
    print(list);
    print(order.zoneName);
    print(order.roomNumber);

    final response = await http.post(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.createOrder}'),
      headers: {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json'
      },
      body: json.encode(
        {
          'name': order.name,
          'phone': order.phone,
          'desc': order.desc,
          'payment_type': 2,
          'zone_name': order.zoneName,
          'room_number': order.roomNumber,
          'latitude': order.lat,
          'longitude': order.lng,
          'home_number': order.homeNumber,
          'floor': order.floor,
          'enterance': order.enterance,
          'appartment': order.apartment,
          'goods': list
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
      case StatusCodes.good:
        return CreatedOrderModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel();
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> confirmOrById(
      String name, String phone, int id) async {
    // try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    print(token);
    final response = await http.post(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.confirmCard}/$id'),
      headers: {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json'
      },
      body: json.encode(
        {
          'name': name,
          'phone': phone,
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
      case StatusCodes.good:
        return ConfirmOrderByCard.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel();
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> payForOrder(int id) async {
    // try {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');

    print(token);
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getPayments}$id'),
      headers: {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json'
      },
    );
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return PaymentTypesModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel();
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> getZone() async {
    // try {

    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getZone}'),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return ZoneModels.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel();
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }
}
