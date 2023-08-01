import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showy/controllers/todo_controller.dart';

import '../../utils/consts.dart';
import 'add_todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController =
      Get.put(TodoController());

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTodo());
        },
        backgroundColor: AppColors.greenish,
        child: const Icon(
          Icons.add,
          color: AppColors.greyish,
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent,
              child: const Icon(
                Icons.delete,
                color: AppColors.greyish,
              ),
            ),
            onDismissed: (_) {
              todoController.todos.removeAt(index);
            },
            child: ListTile(
              tileColor: AppColors.greyish,
              title: Text(
                todoController.todos[index].text!,
                style: todoController.todos[index].done
                    ? const TextStyle(
                        color: AppColors.white,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.redAccent,
                        decorationThickness: 3)
                    : const TextStyle(color: AppColors.white),
              ),
              trailing: Checkbox(
                checkColor: AppColors.greyish,
                activeColor: AppColors.greenish,
                value: todoController.todos[index].done,
                onChanged: (newVal) {
                  var todo = todoController.todos[index];
                  todo.done = newVal!;
                  todoController.todos[index] = todo;
                },
              ),
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
    );
  }
}
