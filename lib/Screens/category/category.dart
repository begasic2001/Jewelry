import 'package:app_trang_suc/Screens/tabbar/categorytabbar/category_all_tabbar.dart';
import 'package:app_trang_suc/Screens/tabbar/categorytabbar/category_men_tabbar.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/stylies/category_screen_stylies.dart';
import 'package:app_trang_suc/data/category_screen_data.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  AppBar buildAppBar() {
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
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 35,
          ),
          onPressed: () {},
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
