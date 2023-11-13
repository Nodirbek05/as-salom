import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/core/common_models/status_codes.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/views/product_detail/data/models/get_pro_with_slug_model.dart';
import 'package:http/http.dart' as http;

class GetProWithSlug {
  GetProWithSlug._();
  static Future<ResponseData> getProSlug(String slug) async {
    // try {

    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}${ApiPaths.getWithSlug}$slug'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return GetProWithSlugModel.fromJson(response.body);
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
