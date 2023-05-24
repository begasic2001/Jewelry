import 'dart:convert';

import 'package:app_trang_suc/Screens/history/history_srceen.dart';
import 'package:app_trang_suc/Screens/login/login.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/models/profile_model.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  var name;
  var address;
  late UserModel userVM;
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.70,
      centerTitle: true,
      backgroundColor: AppColors.baseWhiteColor,
      title: Text(
        "Tài Khoản",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.edit,
            color: AppColors.baseBlackColor,
            width: 25,
          ),
        )
      ],
      shadowColor: AppColors.baseGrey10Color,
    );
  }

  Widget buildlistTileWidget(
      {required String leading, required String trailing}) {
    return ListTile(
      tileColor: AppColors.baseWhiteColor,
      leading: Text(
        leading,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildBottomListTile(
      {required String leading, required String trailing}) {
    return ListTile(
      onTap: () {},
      tileColor: AppColors.baseWhiteColor,
      leading: Text(
        leading,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Wrap(
        spacing: 5,
        children: [
          Text(
            trailing,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget buildHistory(
      {required String leading,
      required String trailing,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      tileColor: AppColors.baseWhiteColor,
      leading: Text(
        leading,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Wrap(
        spacing: 5,
        children: [
          Text(
            trailing,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    GetProfileUserName();
    GetProfileUserAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseGrey10Color,
      appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 10),
            color: AppColors.baseWhiteColor,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Center(
                  //   child: CircleAvatar(
                  //     radius: 35,
                  //     backgroundColor: Colors.transparent,
                  //     backgroundImage:
                  //         NetworkImage("https://i.pinimg.com/originals/7b/48/65/7b48654b92587f3df86c21d7071bad42.jpg"),
                  //   ),
                  // ),
                  Text(
                    //"ten",
                    name.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   "bio asp.net core",
                  //   textAlign: TextAlign.center,
                  // )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                //buildlistTileWidget(leading: "Họ & Tên", trailing: "Lương Minh Thành"),
                Divider(),
                buildlistTileWidget(
                  leading: "Email",
                  trailing: user.email!.toString(),
                ),
                Divider(),
                buildlistTileWidget(
                  leading: "Địa Chỉ",
                  trailing: address.toString(), //result.address!.toString()
                ),
                // Divider(),
                // buildlistTileWidget(
                //   leading: "Thanh Toán",
                //   trailing: "6011\t****\t****\t1117",
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                // buildBottomListTile(
                //   leading: "Yêu Thích",
                //   trailing: "5",
                // ),
                // Divider(),
                // buildBottomListTile(
                //   leading: "Giỏ Hàng",
                //   trailing: "",
                // ),
                Divider(),
                buildHistory(
                    leading: "Lịch Sử",
                    trailing: "",
                    onTap: () {
                      PageRouting.goToNextPage(
                          context: context, navigateTo: HistoryPage());
                    }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: RoundedButton(
              //color: AppColors.baseDarkPinkColor,
              title: "Đăng Xuất",
              onTap: signOut,
              // () {
              //   PageRouting.goToNextPage(
              //     context: context,
              //     navigateTo: Login(),
              //   );
              // }
            ),
          ),
        ],
      ),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void GetProfileUserName() {
    var ref = FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(user.uid)
        .child('name')
        .onValue;
    ref.listen((event) {
      var result1 = event.snapshot.value;
      print("name:::::::::::::");
      print(result1);
      setState(() {
        name = result1;
      });
    });
  }

  void GetProfileUserAddress() {
    var ref = FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(user.uid)
        .child('address')
        .onValue;
    ref.listen((event) {
      var result2 = event.snapshot.value;
      print("address:::::::::::::");
      print(result2);
      setState(() {
        address = result2;
      });
    });
  }
}
