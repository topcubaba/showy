import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showy/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:showy/services/storage.dart';

import '../utils/consts.dart';
import '../view/screens/homepage.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SecureStorage secureStorage = SecureStorage();

  Future<void> login() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        secureStorage.writeSecureData("isLogged", "true");

        emailController.clear();
        passwordController.clear();
        Get.off(() => const MyHomePage());
      } else {
        throw jsonDecode(response.body)["Message"] ?? AppStrings.loginError;
      }
    } catch (error) {
      Get.back();
      Get.snackbar(AppStrings.error, error.toString(),
          colorText: AppColors.white);
    }
  }
}
