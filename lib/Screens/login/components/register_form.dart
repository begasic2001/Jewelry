import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/components/rounded_input.dart';
import 'package:app_trang_suc/components/rounded_password_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.emailController,
    required this.passwordController,
    required this.fullnameController,
    required this.addressController,
    this.onTap
  }) : super(key: key);
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final TextEditingController emailController;
  final TextEditingController passwordController;
    final TextEditingController fullnameController;
  final TextEditingController addressController;
  final VoidCallback? onTap;
  // assets/images/register.svg
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),

                  Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),

                  SizedBox(height: 40),

                  SvgPicture.asset('assets/images/register.svg'),
                  //SvgPicture.asset('assets/images/register.svg',semanticsLabel: 'logo',),

                  SizedBox(height: 40),

                  RoundedInput(
                    icon: Icons.mail,
                    hint: 'Email',
                    emailController: emailController,
                  ),

                  // RoundedInput(
                  //   icon: Icons.face_rounded,
                  //   hint: 'Tên Đăng Nhập',
                  //   emailController: emailController,
                  // ),

                  RoundedPasswordInput(
                    hint: 'Mật Khẩu',
                    passwordController: passwordController,
                  ),

                  SizedBox(height: 10),
                   RoundedInput(
                    icon: Icons.person,
                    hint: 'Tên',
                    emailController: fullnameController,
                  ),
                   RoundedInput(
                    icon: Icons.location_on,
                    hint: 'Địa Chỉ',
                    emailController: addressController,
                  ),
                  //RoundedButton(title: 'Đăng Ký',onTap: onTap,),
                  RoundedRegisterButton(
                    title: 'Đăng Ký',
                    onTap: onTap,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedRegisterButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  //this.onTap
  const RoundedRegisterButton({
    Key? key,
    required this.title,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.baseLightOrangeColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      onTap: onTap,
    );
  }
}
