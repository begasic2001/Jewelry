import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_trang_suc/components/input_container.dart';
import 'package:app_trang_suc/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  
  RoundedPasswordInput({Key? key, required this.hint,required this.passwordController}) : super(key: key);
  final String hint;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: passwordController,
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: AppColors.baseLightOrangeColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
