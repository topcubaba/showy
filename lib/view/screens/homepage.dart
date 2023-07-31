import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/view/screens/todo.dart';
import 'package:showy/view/screens/users.dart';

import '../../services/storage.dart';
import '../../utils/consts.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = [
    const Users(),
    const Todo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.greyish,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: context.padding.onlyLeftLow,
                child: const Text(
                  AppStrings.AppName,
                  style: TextStyle(
                      color: AppColors.greenish,
                      fontWeight: FontWeight.w900,
                      fontSize: 26),
                ),
              ),
              const IconButton(
                  onPressed: logout,
                  icon: Icon(
                    Icons.logout_outlined,
                    color: AppColors.greenish,
                  ))
            ],
          )),
      backgroundColor: AppColors.backgroundColor,
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.greyish,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.greenish,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: AppStrings.Users),
          BottomNavigationBarItem(
              icon: Icon(Icons.task), label: AppStrings.Todo)
        ],
      ),
    );
  }
}

Future<void> logout() async {
  final SecureStorage secureStorage = SecureStorage();
  await secureStorage.writeSecureData("isLogged", "false");

  Get.off(() => const LoginScreen());
}
