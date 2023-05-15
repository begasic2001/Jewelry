import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:app_trang_suc/components/input_container.dart';
import 'package:app_trang_suc/constants.dart';

class RoundedInput extends StatelessWidget {
  RoundedInput(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.emailController})
      : super(key: key);
  final TextEditingController emailController;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      
        child: TextFormField(
      controller: emailController,
      cursorColor: AppColors.baseLightOrangeColor,
      decoration: InputDecoration(
          icon: Icon(icon, color: AppColors.baseLightOrangeColor),
          hintText: hint,
          border: InputBorder.none),
      validator: (email) => email != null && EmailValidator.validate(email)
          ? "Vui lòng nhập email"
          : null,
    ));
  }
}
