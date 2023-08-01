import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/models/todo_model.dart';
import 'package:showy/controllers/todo_controller.dart';

import '../../utils/consts.dart';

class AddTodo extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController todoTEC = TextEditingController();

  AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.greyish,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: context.padding.onlyLeftLow,
                child: const Text(
                  AppStrings.appName,
                  style: TextStyle(
                      color: AppColors.greenish,
                      fontWeight: FontWeight.w900,
                      fontSize: 26),
                ),
              ),
              const Text(AppStrings.addTodo,
                  style: TextStyle(color: AppColors.greenish))
            ],
          )),
      body: Container(
        color: AppColors.greyish,
        padding: context.padding.medium,
        child: Column(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: AppStrings.writeTodo,
                  hintStyle: TextStyle(color: AppColors.white),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 15,
                autofocus: true,
                controller: todoTEC,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.close, color: Colors.redAccent),
                      Text(
                        AppStrings.cancel,
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox( height: context.sized.dynamicHeight(0.05),
                    child: const VerticalDivider(
                  color: AppColors.white,
                  thickness: 2,
                )),
                GestureDetector(
                  onTap: () {
                    todoController.todos.add(
                      Todo(
                        text: todoTEC.text,
                      ),
                    );
                    Get.back();
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.check, color: AppColors.greenish),
                      Text(
                        AppStrings.add,
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
