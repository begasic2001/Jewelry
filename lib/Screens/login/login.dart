import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/main.dart';
import 'package:app_trang_suc/models/cart_model.dart';
import 'package:app_trang_suc/models/profile_model.dart';
import 'package:app_trang_suc/mybottombar/my_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_trang_suc/constants.dart';
import 'package:app_trang_suc/Screens/login/components/cancel_button.dart';
import 'package:app_trang_suc/Screens/login/components/login_form.dart';
import 'package:app_trang_suc/Screens/login/components/register_form.dart';
import 'package:uuid/uuid.dart';

import '../../routes/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = Duration(milliseconds: 270);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));
    return Scaffold(
      key: formKey,
      body: Stack(
        children: [
          // Lets add some decorations
          Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.baseLightOrangeColor),
              )),

          Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.baseLightOrangeColor),
              )),

          // Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: isLogin
                ? null
                : () {
                    // returning null to disable the button
                    animationController!.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
          ),

          // Login Form
          LoginForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultLoginSize,
              emailController: emailController,
              passwordController: passwordController,
              onTap: () {
                signIn(context);
              }),
          // () => {
          //          PageRouting.goToNextPage(context: context, navigateTo: MyBottomBar())
          //     })
          // Register Container
          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }

              // Returning empty container to hide the widget
              return Container();
            },
          ),

          // Register Form
          RegisterForm(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            defaultLoginSize: defaultRegisterSize,
            emailController: emailController,
            passwordController: passwordController,
            fullnameController: fullnameController,
            addressController: addressController,
            onTap: () {
              signUp(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: kBackgroundColor),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController!.forward();

                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? const Text(
                  "Bạn chưa có tài khoản? Đăng ký",
                  style:
                      TextStyle(color: AppColors.baseBlackColor, fontSize: 18),
                )
              : null,
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Utils.showSnackBar(context, "Vui lòng nhập email và mật khẩu");
      return;
    }

    if (!_isValidEmail(email)) {
      Utils.showSnackBar(context, "Email không hợp lệ");
      return;
    }

    if (password.length < 6) {
      Utils.showSnackBar(context, "Mật khẩu phải có ít nhất 6 ký tự");
      return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(context, e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future<void> signUp(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = fullnameController.text.trim();
    String address = addressController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Utils.showSnackBar(context, "Vui lòng nhập email và mật khẩu");
      return;
    }

    if (!_isValidEmail(email)) {
      Utils.showSnackBar(context, "Email không hợp lệ");
      return;
    }

    if (password.length < 6) {
      Utils.showSnackBar(context, "Mật khẩu phải có ít nhất 6 ký tự");
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        var user = FirebaseAuth.instance.currentUser!;
        RegisterUser(user.uid,email, password, name, address);

      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(context, e.message);
    }

    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  RegisterUser(String uid,String email, String password, String name, String address) {
    var user = FirebaseDatabase.instance.ref().child('Users');
    var userProfile = new UserModel(
        uid: uid,
        email: email, password: password, name: name, address: address);
   
    user.child(uid).set(userProfile.toJson());
  }
}

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(BuildContext context, String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      key: messengerKey,
      content: Text(text),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
