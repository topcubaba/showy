import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showy/utils/consts.dart';
import 'package:showy/view/homepage.dart';
import 'package:showy/view/login.dart';

import '../services/storage.dart';

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
    Timer(Duration(seconds: 3), () {
      if (isLogged == "false") {
        Get.off(() => const LoginScreen());
      } else {
        Get.off(() => const MyHomePage(title: "logged in!"));
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
            child: Text(AppStrings.AppName,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w800)),
          ),
        ));
  }
}
