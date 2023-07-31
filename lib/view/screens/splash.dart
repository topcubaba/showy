import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showy/utils/consts.dart';

import '../../services/storage.dart';
import 'homepage.dart';
import 'login.dart';

String? isLogged;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData("isLogged").then((value) {
      isLogged = value;
    });
    Timer(Duration(seconds: 2), () {
      if (isLogged == "false") {
        Get.off(() => const LoginScreen());
      } else {
        Get.off(() => const MyHomePage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          child: Center(
            child: Text(AppStrings.appName,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w800)),
          ),
        ));
  }
}
