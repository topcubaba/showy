import 'package:flutter/material.dart';

import '../../utils/consts.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add, color: AppColors.greyish,),
        backgroundColor: AppColors.greenish,
      ),
    );
  }
}
