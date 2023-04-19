import 'package:app_trang_suc/Screens/details/detail.dart';
import 'package:app_trang_suc/Screens/filter/filter.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/Screens/tabbar/tabbar_data.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/stylies/home_screen_stylies.dart';
import 'package:app_trang_suc/data/home_page_data.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter_svg/svg.dart';

import 'components/show_all_widget.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatelessWidget {
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      bottom: const TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseLightOrangeColor,
        tabs: [
          Text("Tất Cả"),
          Text("Nhẫn"),
          Text("Vòng"),
          Text("Bông Tai"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: const [
          Text(
            "WELCOME",
            style: HomeScreenStylies.appBarUpperTitleStylies,
          ),
          Text(
            "JEWELRY",
            style: HomeScreenStylies.appBarBottomTitleStylies,
          )
        ],
      ),
      actions: [
        IconButton(
          icon: RotationTransition(
            turns: AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
              SvgImages.filter,
              width: 30,
            ),
          ),
          onPressed: () {
            PageRouting.goToNextPage(
              context: context,
              navigateTo: FilterScreen(),
            );
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            width: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildAdvertismentPlace() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Container(
        height: 170,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 1000),
          showIndicator: false,
          images: [
            Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://xuconcept.com/wp-content/uploads/2017/08/Ch%E1%BB%A5p-h%C3%ACnh-s%E1%BA%A3n-ph%E1%BA%A9m-trang-s%E1%BB%A9c.png"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://i.pinimg.com/236x/e4/21/92/e42192b0682ede9d80d92260fb5e17cd.jpg",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrendingProduct({
    String? productImage,
    String? productName,
    String? productModel,
    double? productPrice,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
      height: 65,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage!),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName!,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStylies.trendingProductNameStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    productModel!,
                    style: HomeScreenStylies.trendingProductModelStyle,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: MaterialButton(
              color: AppColors.baseLightPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(0.7),
              ),
              onPressed: () {},
              child: Text(
                "$productPrice",
                style: HomeScreenStylies.trendingProductPriceStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildAdvertismentPlace(),
                ShowAllWidget(leftText: "Hàng Mới Về"),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: singleProductData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      var arrivalDataStore = singleProductData[index];
                      return SingleProductWidget(
                        productImage: arrivalDataStore.productImage,
                        productName: arrivalDataStore.productName,
                        productModel: arrivalDataStore.productModel,
                        productPrice: arrivalDataStore.productPrice,
                        productOldPrice: arrivalDataStore.productOldPrice,
                        onTap: () => {
                          PageRouting.goToNextPage(
                              context: context,
                              navigateTo: DetailScreen(data: arrivalDataStore))
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                ShowAllWidget(
                  leftText: "Xu Hướng",
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                ShowAllWidget(
                  leftText: "Nhiều Người Tìm Kiếm",
                ),
                Container(
                  height: 260,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    itemCount: singleProductData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      //var historyDataStore = shoesData[index];
                      var arrivalDataStore = singleProductData[index];
                      return SingleProductWidget(
                          onTap: () {
                            PageRouting.goToNextPage(
                              context: context,
                              navigateTo: DetailScreen(
                                data: arrivalDataStore,
                              ),
                            );
                          },
                          productImage: arrivalDataStore
                              .productImage, //historyDataStore.productImage,
                          productModel: arrivalDataStore
                              .productName, //historyDataStore.productModel,
                          productName: arrivalDataStore
                              .productName, //historyDataStore.productName,
                          productOldPrice: arrivalDataStore
                              .productOldPrice, //historyDataStore.productOldPrice,
                          productPrice: arrivalDataStore
                              .productPrice //historyDataStore.productPrice
                          );
                    },
                  ),
                ),
              ],
            ),
            TabBarBar(
              productData: colothsData,
            ),
            TabBarBar(
              productData: shoesData,
            ),
            TabBarBar(
              productData: accessoriesData,
            ),
          ],
        ),
      ),
    );
  }
}
