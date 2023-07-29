import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import '../../utils/consts.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  const SubmitButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.dynamicHeight(0.08),
      width: context.sized.dynamicWidth(0.9),
      padding: context.padding.low,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: context.border.highBorderRadius,
              side: BorderSide.none)
            ),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.greenish)
          ),
          onPressed: null,
          child: Text(title, 
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold
          )),
        ),
      
    );
  }
}
