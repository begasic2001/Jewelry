import 'package:flutter/material.dart';
import 'package:app_trang_suc/components/input_container.dart';
import 'package:app_trang_suc/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  RoundedPasswordInput({Key? key, required this.hint}) : super(key: key);
  final String hint;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: myController,
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
