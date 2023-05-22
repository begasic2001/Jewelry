import 'dart:convert';

import 'package:app_trang_suc/Screens/category/components/category_product.dart';
import 'package:app_trang_suc/Screens/category/sub_category.dart';
import 'package:app_trang_suc/Screens/details/detail.dart';
import 'package:app_trang_suc/Screens/homepage/components/show_all_widget.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/data/category_screen_data.dart';
import 'package:app_trang_suc/data/home_page_data.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/models/categoryProductModel.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CategoryMenTabBar extends StatefulWidget {
  List<CategoryProductModel> categoryProductModel = [];
  CategoryMenTabBar({
    required this.categoryProductModel,
  });

  @override
  State<CategoryMenTabBar> createState() => _CategoryMenTabBarState();
}

class _CategoryMenTabBarState extends State<CategoryMenTabBar> {
  List<SingleProductModel> ringDatas =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> accessoriesData =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> necklaceDatas =
      new List<SingleProductModel>.empty(growable: true);
  @override
  void initState() {
    getRingDatas();
    getaccessoriesDatas();
    getnecklaceDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data;
    buildConditions(index) {
      if (index == 0) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            //productModel: data.productModel,
            productData: ringDatas,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 1) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            //productModel: data.productModel,
            productData: necklaceDatas,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 2) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            // productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.categoryProductModel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        data = widget.categoryProductModel[index];
        return CategoryProductWidget(
          onPressed: () {
            buildConditions(index);
          },
          productImage: data.productImage,
          //productModel: "${colothsData.length}\t${data.productModel}",
          productName: data.productName,
        );
      },
    );
  }

  void getRingDatas() {
    var ref = FirebaseDatabase.instance.ref().child('colothsData').onValue;
    List<SingleProductModel> tempData = [];
    ref.listen((DatabaseEvent event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      ringDatas.clear();
      map.forEach((key, value) {
        var colothSingleProductModel =
            new SingleProductModel.fromJson(json.decode(json.encode(value)));
        colothSingleProductModel.key = key;
        tempData.add(colothSingleProductModel);
        setState(() => ringDatas = tempData);
      });
    });
  }

  void getaccessoriesDatas() {
    var ref = FirebaseDatabase.instance.ref().child('accessoriesData').onValue;
    List<SingleProductModel> tempData = [];
    ref.listen((DatabaseEvent event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      accessoriesData.clear();
      map.forEach((key, value) {
        var colothSingleProductModel =
            new SingleProductModel.fromJson(json.decode(json.encode(value)));
        colothSingleProductModel.key = key;
        tempData.add(colothSingleProductModel);
        setState(() {
          accessoriesData = tempData;
        });
      });
    });
  }

  void getnecklaceDatas() {
    var ref = FirebaseDatabase.instance.ref().child('shoesData').onValue;
    List<SingleProductModel> tempData = [];
    ref.listen((DatabaseEvent event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      necklaceDatas.clear();
      map.forEach((key, value) {
        var colothSingleProductModel =
            new SingleProductModel.fromJson(json.decode(json.encode(value)));
        colothSingleProductModel.key = key;
        tempData.add(colothSingleProductModel);
        setState(() {
          necklaceDatas = tempData;
        });
      });
    });
  }
}
