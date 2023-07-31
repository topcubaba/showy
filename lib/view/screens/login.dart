import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:showy/utils/consts.dart';
import 'package:showy/view/widgets/confirm_button.dart';
import 'package:showy/view/widgets/login_text_field.dart';
import 'package:showy/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginController loginController = Get.put(LoginController());

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
          AppStrings.appName,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: AppColors.white,
            fontSize: 36,
          ),
        ),
        Padding(
          padding: context.padding.onlyBottomMedium,
          child: const Text(
            AppStrings.loginDesc,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
        ),
        LoginTextField(
          label: "E-mail*",
          hintText: "Please enter your e-mail",
          controller: loginController.emailController,
          isEmail: true,
          isPassword: false,
        ),
        LoginTextField(
          label: "Password",
          hintText: "Please enter your password",
          controller: loginController.passwordController,
          isPassword: true,
        ),
        const Spacer(),
        Padding(
          padding: context.padding.verticalMedium,
          child: ConfirmButton(
            title: "Login",
            onPressed: () => loginController.login(),
            isDisabled: false,
          ),
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
