import 'dart:convert';

import 'package:app_trang_suc/Screens/tabbar/categorytabbar/category_all_tabbar.dart';
import 'package:app_trang_suc/Screens/tabbar/categorytabbar/category_men_tabbar.dart';
import 'package:app_trang_suc/Screens/yourcart/cart_detail.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/stylies/category_screen_stylies.dart';
import 'package:app_trang_suc/data/category_screen_data.dart';
import 'package:app_trang_suc/models/cart_model.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   List<CartModel> carts = new List<CartModel>.empty(growable: true);
  AppBar buildAppBar() {
    final user = FirebaseAuth.instance.currentUser!;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Chào Mừng",
        style: CategoryScreenStylies.categoryAppBarTitleStyle,
      ),
      actions: [
        RotationTransition(
          turns: AlwaysStoppedAnimation(90 / 360),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
              width: 35,
            ),
          ),
        ),
      Padding(
          padding: const EdgeInsets.only(top: 10, right: 20),
          child: StreamBuilder(
            stream: FirebaseDatabase.instance
                .ref()
                .child('Cart')
                .child(user.uid)
                .onValue,
            builder: (context, AsyncSnapshot snapshot) {
              var numberItemInCart = 0;
              if (snapshot.hasData) {
                var map = snapshot.data.snapshot.value;
                carts.clear();
                if (map != null) {
                  map.forEach((key, value) {
                    var cartModel =
                        CartModel.fromJson(json.decode(json.encode(value)));
                    carts.add(cartModel);
                  });
                  numberItemInCart = carts
                      .map<int>((c) => c.productQuantity!)
                      .reduce((a, b) => a + b);
                }

                return GestureDetector(
                  onTap: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: CartDetail(),
                    );
                  },
                  child: Center(
                      child: badges.Badge(
                    showBadge: true,
                    badgeContent: Text(
                      '${numberItemInCart > 9 ? 9.toString() + "+" : numberItemInCart.toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  )),
                );
              } else {
                return Center(
                  child: badges.Badge(
                      showBadge: true,
                      badgeContent: Text(
                        '0',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )),
                );
              }
            },
          ),
        )
      ],
      bottom: TabBar(
        indicator: BoxDecoration(color: Colors.transparent),
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseLightOrangeColor,
        automaticIndicatorColorAdjustment: false,
        tabs: [
          Text("Tất Cả"),
          Text("Nam"),
          Text("Nữ"),
          Text("Trẻ Em"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.baseWhiteColor,
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            //All Place
            CategoryAllTabBar(),
            // //Men  Place
            CategoryMenTabBar(
              categoryProductModel: menCategoryData,
            ),
            // //woman Place
            CategoryMenTabBar(
              categoryProductModel: womenCategoryData,
            ),
            // //Kids place
            CategoryMenTabBar(
              categoryProductModel: forKids,
            ),
          ],
        ),
      ),
    );
  }
}
