import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/utils/consts.dart';
import 'package:showy/view/widgets/submit_button.dart';
import 'package:showy/view/widgets/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            fontSize: 36,
          ),
        ),
        Padding(
          padding: context.padding.onlyBottomMedium,
          child: const Text(
            AppStrings.LoginDescription,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
        ),
        LoginTextField(label: "E-mail*", hintText: "Please enter your e-mail", controller: emailController, isEmail: true, isPassword: false,),
        LoginTextField(label: "Password", hintText: "Please enter your password", controller: passwordController, isPassword: true,),
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
    height: context.sized.dynamicHeight(0.30),
    child: SvgPicture.asset('assets/undraw_working.svg'),
  );
}
