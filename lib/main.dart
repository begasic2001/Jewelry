import 'package:app_trang_suc/Screens/confirmation/confirmation.dart';
import 'package:app_trang_suc/Screens/homepage/homepage.dart';
import 'package:app_trang_suc/Screens/login/components/login_form.dart';
import 'package:app_trang_suc/Screens/yourcart/cart_detail.dart';
import 'package:app_trang_suc/mybottombar/my_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_trang_suc/constants.dart';
import 'package:app_trang_suc/Screens/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Jewelry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            return MyBottomBar();
          }
          return Login();
        },
      ),
    );
  }
}
