import 'package:app_trang_suc/Screens/details/detail.dart';
import 'package:app_trang_suc/Screens/homepage/components/show_all_widget.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/data/home_page_data.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/models/categoryProductModel.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:flutter/material.dart';
class CategoryMenTabBar extends StatelessWidget {
  List<CategoryProductModel> categoryProductModel = [];
  CategoryMenTabBar({
    required this.categoryProductModel,
  });

  @override
  Widget build(BuildContext context) {
    var data;
    buildConditions(index) {
      if (index == 0) {
        //PageRouting.goToNextPage(
          //fillClothData[index]
          // navigateTo: SubCategory(
          //   productModel: data.productModel,
          //   productData: colothsData,
          //   productName: data.productName,
          // ),
          // context: context,
        //);
      } else if (index == 1) {
       //PageRouting.goToNextPage(
          //fillClothData[index]
          // navigateTo: SubCategory(
          //   productModel: data.productModel,
          //   productData: colothsData,
          //   productName: data.productName,
          // ),
          //context: context,
        //);
      } else if (index == 2) {
        //PageRouting.goToNextPage(
          // navigateTo: SubCategory(
          //   productModel: accessoriesData[index].productModel,
          //   productData: accessoriesData,
          //   productName: menCategoryData[index].productName,
          // ),
        //   context: context,
        // );
      } else if (index == 3) {
        //PageRouting.goToNextPage(
          // navigateTo: SubCategory(
          //   productModel: accessoriesData[index].productModel,
          //   productData: accessoriesData,
          //   productName: menCategoryData[index].productName,
          // ),
          //context: context,
        //);
      } else if (index == 4) {
        //PageRouting.goToNextPage(
          // navigateTo: SubCategory(
          //   productModel: accessoriesData[index].productModel,
          //   productData: accessoriesData,
          //   productName: menCategoryData[index].productName,
          // ),
          //context: context, navigateTo: null,
        //);
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryProductModel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        data = categoryProductModel[index];
        // return CategoryProductWidget(
        //   onPressed: () {
        //     buildConditions(index);
        //   },
        //   productImage: data.productImage,
        //   productModel: "${colothsData.length}\t${data.productModel}",
        //   productName: data.productName,
        // );
      },
    );
  }
}