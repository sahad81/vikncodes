import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:vikn_codes_machin_test/util/app_constants.dart';

class SalesRepo {
  static Future<Response> getsalelist(String token, int page) async {
    try {
      http.Response _response = await http.post(
        Uri.parse(AppConstants.salslistUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', // Specify content type as JSON
        },
        body: jsonEncode({
          "BranchID": 1,
          "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
          "CreatedUserID": 62,
          "PriceRounding": "3",
          "page_no": page,
          "items_per_page": 15,
          "type": "Sales",
          "WarehouseID": "1",
        }),
      ).timeout(const Duration(seconds: 14));

      print("res" + _response.toString());

      if (_response.statusCode == 200) {
           Map<String, dynamic> decodedBody = jsonDecode(_response.body);
        
        return Response(body: decodedBody, statusCode: _response.statusCode);
      } else {
      return Response(body: _response.body, statusCode: 1);
      }
    } catch (e) {
      print('errorr' + e.toString());
      return Response(statusCode: 1);
    }
  }
}
