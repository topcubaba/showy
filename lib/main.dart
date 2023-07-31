import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showy/services/storage.dart';
import 'package:showy/utils/consts.dart';
import 'package:showy/view/homepage.dart';
import 'package:showy/view/login.dart';
import 'package:showy/view/splash.dart';
import 'controllers/login_controller.dart';

Future<void> main() async {
  runApp(const MyApp());
}

LoginController loginController = Get.put(LoginController());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Showy',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
