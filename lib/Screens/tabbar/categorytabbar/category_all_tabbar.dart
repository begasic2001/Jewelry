import 'package:app_trang_suc/Screens/details/detail.dart';
import 'package:app_trang_suc/Screens/homepage/components/show_all_widget.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/data/home_page_data.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:flutter/material.dart';

class CategoryAllTabBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ShowAllWidget(
          leftText: "Nhẫn",
        ),
        builderRender(singleProduct: colothsData),
        ShowAllWidget(
          leftText: "Vòng Cổ",
        ),
        builderRender(
          singleProduct: shoesData,
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
}
