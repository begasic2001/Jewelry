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
  @override
  Widget build(BuildContext context) {
    var data;
    buildConditions(index) {
      if (index == 0) {
        PageRouting.goToNextPage(
          
          navigateTo: SubCategory(
            productModel: data.productModel,
            productData: colothsData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 1) {
       PageRouting.goToNextPage(
         
          navigateTo: SubCategory(
            productModel: data.productModel,
            productData: shoesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 2) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
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
}