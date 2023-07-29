import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/utils/consts.dart';
import 'package:showy/view/widgets/submit_button.dart';
import 'package:showy/view/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Column(children: [
        buildContainerPaddingAndHeight(context),
        const Text(
          AppStrings.AppName,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: AppColors.white,
            fontSize: 48,
          ),
        ),
        const Text(
          AppStrings.LoginDescription,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
        CustomTextField(label: "E-Mail*"),
        const Spacer(),
        Padding(
          padding: context.padding.verticalMedium,
          child: const SubmitButton(title: "Login"),
        )
      ]),
    );
  }
}

Widget buildContainerPaddingAndHeight(BuildContext context) {
  return Container(
    padding: context.padding.verticalMedium,
    height: context.sized.dynamicHeight(0.35),
    child: SvgPicture.asset('assets/undraw_working.svg'),
  );
}
