import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/utils/consts.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.label,
    this.onTap,
    required this.isPassword,
    this.isEmail,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String label;
  final VoidCallback? onTap;
  final bool isPassword;
  final bool? isEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.padding.verticalLow,
          child: Padding(
            padding: context.padding.horizontalMedium,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: context.padding.onlyLeftLow,
                      child: Text(
                        label,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                TextFormField(
                  style: const TextStyle(color: AppColors.white, fontSize: 14),
                  obscureText: isPassword ? true : false,
                  controller: controller,
                  cursorColor: AppColors.white,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (isEmail == true) {
                      if (GetUtils.isEmail(value!)) {
                        return null;
                      } else {
                        return AppStrings.emailError;
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greyish,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.border.highBorderRadius,
                      borderSide: const BorderSide(color: AppColors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: context.border.highBorderRadius,
                      borderSide: const BorderSide(color: AppColors.white),
                    ),
                    hintText: hintText,
                    hintStyle:
                        const TextStyle(color: AppColors.white, fontSize: 14),
                    labelStyle:
                        const TextStyle(color: AppColors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
