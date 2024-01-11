// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes_machin_test/src/model/responsemodel.dart';
import 'package:vikn_codes_machin_test/src/data/repo/authrepo.dart';
import 'package:vikn_codes_machin_test/util/app_constants.dart';

class AuthController extends GetxController {
  final SharedPreferences preferences;
  AuthController({required this.preferences});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _toglePas = false;
  bool get toglepas => _toglePas;
  ResponseModel? res;
  bool isLoggedIn() {
    return preferences.containsKey(AppConstants.TOKEN);
  }

  showpassword() {
    _toglePas =! _toglePas;
    update();
  }

  Future<ResponseModel> login(String userId, String password) async {
    try {
      _isLoading = true;
      update();

      Response data = await AuthRepo.login(userId, password);
      print(data.body);

      Map<String, dynamic> responseBody = json.decode(data.body);

      if (responseBody.containsKey('success')) {
        int? successCode = int.tryParse(responseBody['success'].toString());

        if (successCode == 6000) {
          preferences.setString(
              AppConstants.TOKEN, responseBody['data']['access']);
          return ResponseModel(true, responseBody['message']);
        } else {
          return ResponseModel(false, responseBody['error']);
        }
      } else {
        return ResponseModel(false, "Something went wrong");
      }
    } catch (e) {
      print("Error: $e");
      return ResponseModel(false, "Something went wrong");
    } finally {
      _isLoading = false;
      update();
    }
  }
}
