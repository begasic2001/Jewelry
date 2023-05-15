import 'package:app_trang_suc/Screens/homepage/homepage.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/components/rounded_input.dart';
import 'package:app_trang_suc/components/rounded_password_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_trang_suc/constants.dart';

import '../../../routes/routes.dart';

class LoginForm extends StatelessWidget {
 
   LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.emailController,
    required this.passwordController,
    this.onTap
  }) : super(key: key);
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final VoidCallback? onTap;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  
                  'CHÀO MỪNG QUAY TRỞ LẠI',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 40),
                SvgPicture.asset('assets/images/login.svg'),
                SizedBox(height: 40),
                RoundedInput(icon: Icons.mail, hint: 'Email',emailController: emailController,),
                RoundedPasswordInput(hint: 'Mật Khẩu',passwordController: passwordController,),
                SizedBox(height: 10),
                RoundedButton(
                  title: 'Đăng Nhập',
                  onTap: onTap,
                ),
                  //  onTap: () => {
                  //   PageRouting.goToNextPage(
                  //       context: context, navigateTo: HomePage())
                  // },
                SizedBox(height: 10),
                const Text(
                  "Hoặc",
                  style: TextStyle(
                      color: AppColors.baseLightOrangeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    SocialLogin(
                      iconSrc: "assets/socials/facebook.svg",
                      press: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SocialLogin(
                      iconSrc: "assets/socials/google.svg",
                      press: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SocialLogin(
                      iconSrc: "assets/socials/twitter.svg",
                      press: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocialLogin({super.key, required this.iconSrc, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColors.baseLightOrangeColor),
                shape: BoxShape.circle),
            child: SvgPicture.asset(
              iconSrc,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
