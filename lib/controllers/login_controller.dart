import 'dart:convert';
import 'dart:math';

import 'package:showy/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showy/main.dart';
import 'package:showy/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:showy/services/storage.dart';

import '../view/homepage.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  final SecureStorage secureStorage = SecureStorage();

  Future<void> getIsLoggedIn() async {
    final String? loggedinfo = await _storage.read(key: "isLogged");
    //print(loggedinfo);

  }

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
      print(response.statusCode);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        secureStorage.writeSecureData("isLogged", "true");

        emailController.clear();
        passwordController.clear();
        Get.off(() => MyHomePage(title: "login successfull"));
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
