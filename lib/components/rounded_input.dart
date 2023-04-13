import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_trang_suc/components/input_container.dart';
import 'package:app_trang_suc/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint
  }) : super(key: key);

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: AppColors.baseLightOrangeColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: AppColors.baseLightOrangeColor),
          hintText: hint,
          border: InputBorder.none
        ),
      ));
  }
}