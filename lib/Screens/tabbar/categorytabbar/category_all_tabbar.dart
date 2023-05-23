import 'dart:convert';

import 'package:app_trang_suc/Screens/details/detail.dart';
import 'package:app_trang_suc/Screens/homepage/components/show_all_widget.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/data/home_page_data.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CategoryAllTabBar extends StatefulWidget {
  @override
  State<CategoryAllTabBar> createState() => _CategoryAllTabBarState();
}

class _CategoryAllTabBarState extends State<CategoryAllTabBar> {
  List<SingleProductModel> ringDatas =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> accessoriesData =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> necklaceDatas =
      new List<SingleProductModel>.empty(growable: true);
  Widget builderRender({required List<SingleProductModel> singleProduct}) {
    return Container(
      height: 250,
      child: GridView.builder(
        itemCount: singleProduct.length,
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          var data = singleProduct[index];
          return SingleProductWidget(
            onTap: () {
              PageRouting.goToNextPage(
                  navigateTo: DetailScreen(data: data), context: context);
            },
            productImage: data.productImage,
            productModel: data.productModel,
            productName: data.productName,
            productOldPrice: data.productOldPrice,
            productPrice: data.productPrice,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    getRingDatas();
    getaccessoriesDatas();
    getnecklaceDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ShowAllWidget(
          leftText: "Nhẫn",
        ),
        builderRender(singleProduct: ringDatas),
        ShowAllWidget(
          leftText: "Vòng Cổ",
        ),
        builderRender(
          singleProduct: necklaceDatas,
        ),
        ShowAllWidget(
          leftText: "Hoa Tai",
        ),
        builderRender(
          singleProduct: accessoriesData,
        ),
      ],
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
