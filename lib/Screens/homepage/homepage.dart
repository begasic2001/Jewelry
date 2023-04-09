import 'package:app_trang_suc/components/stylies/home_screen_stylies.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/appColors/app_colors.dart';
import 'components/show_all_widget.dart';
import 'components/singleProduct_widget.dart';

class HomePage extends StatelessWidget {
  //static SingleProductWidget singleProductData;
   AppBar buildAppBar(BuildContext context) {
    return AppBar(
      bottom: const TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
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
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All"),
          Text("Ring"),
          Text("Bracelet"),
          Text("Earring"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: const [
          Text(
            "Welcome",
            style: HomeScreenStylies.appBarUpperTitleStylies,
          ),
          Text(
            "Shopping",
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
            // PageRouting.goToNextPage(
            //   context: context,
            //   navigateTo: FilterScreen(),
            // );
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
        //         buildAdvertismentPlace(),
                 ShowAllWidget(
                   leftText: "New Arrival"
                 ),
                 Padding(
                   padding: EdgeInsets.symmetric(
                     horizontal: 12.0,
                   ),
                   child: GridView.builder(
                      shrinkWrap: true,
                     primary: true,
                     itemCount: 2,
        //             itemCount: sigleProductData.length,
                     physics: NeverScrollableScrollPhysics(),
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       childAspectRatio: 0.7,
                     ),
                     itemBuilder: (context, index) {
                      //  var arrivalDataStore = singleProductData[index];
                      // return SingleProductWidget(
                      //   productImage: arrivalDataStore.productImage,
                      //   productModel: arrivalDataStore.productModel,
                      //   productName: arrivalDataStore.productName,
                      //   productOldPrice: arrivalDataStore.productOldPrice,
                      //   productPrice: arrivalDataStore.productPrice,
                      //   onTap: () {
                         
                      //   },
                      // );
                     },
                  // ),
                 //),
        //         Divider(
        //           indent: 16,
        //           endIndent: 16,
        //         ),
        //         ShowAllWidget(
        //           leftText: "What\'s trending",
        //         ),
        //         buildTrendingProduct(
        //           productImage:
        //               'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
        //           productModel: 'Tank-tops',
        //           productName: 'Classics mesh tank top',
        //           productPrice: 15,
        //         ),
        //         buildTrendingProduct(
        //           productImage:
        //               'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
        //           productModel: 'Tank-tops',
        //           productName: 'Classics mesh tank top',
        //           productPrice: 15,
        //         ),
        //         buildTrendingProduct(
        //           productImage:
        //               'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
        //           productModel: 'Tank-tops',
        //           productName: 'Classics mesh tank top',
        //           productPrice: 15,
        //         ),
        //         ShowAllWidget(
        //           leftText: "Your History",
        //         ),
        //         Container(
        //           height: 260,
        //           child: GridView.builder(
        //             scrollDirection: Axis.horizontal,
        //             shrinkWrap: true,
        //             primary: true,
        //             itemCount: shoesData.length,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 1,
        //               childAspectRatio: 1.5,
        //             ),
        //             itemBuilder: (context, index) {
        //               var historyDataStore = shoesData[index];

        //               return SingleProductWidget(
        //                   onPressed: () {
        //                     PageRouting.goToNextPage(
        //                       context: context,
        //                       navigateTo: DetailScreen(
        //                         data: historyDataStore,
        //                       ),
        //                     );
        //                   },
        //                   productImage: historyDataStore.productImage,
        //                   productModel: historyDataStore.productModel,
        //                   productName: historyDataStore.productName,
        //                   productOldPrice: historyDataStore.productOldPrice,
        //                   productPrice: historyDataStore.productPrice);
        //             },
                   ),
                 ),
               ],
        //     ),
        //     TabBarBar(
        //       productData: colothsData,
        //     ),
        //     TabBarBar(
        //       productData: shoesData,
        //     ),
        //     TabBarBar(
        //       productData: accessoriesData,
             ),
           ],
         ),
      ),
    );
  }
}


 

 
