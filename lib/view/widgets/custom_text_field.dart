import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/utils/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, this.controller, required this.label, this.onTap})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: controller,
              cursorColor: AppColors.backgroundColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.border.highBorderRadius,
                  borderSide: BorderSide(color: AppColors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: context.border.highBorderRadius,
                  borderSide: BorderSide(color: AppColors.white),
                ),
                labelText: label,
                labelStyle:
                    const TextStyle(color: AppColors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
