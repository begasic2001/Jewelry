import 'package:app_trang_suc/Screens/payment/payment.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/components/stylies/detail_screen_stylies.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YourCartScreen extends StatefulWidget {
  @override
  _YourCartScreenState createState() => _YourCartScreenState();
}

class _YourCartScreenState extends State<YourCartScreen> {
  String? sizeController;
  String? colorsController;
  String? quantityController;
  var cartData;
  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(context),
        ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.heart,
            color: AppColors.baseBlackColor,
            width: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.delete,
            color: AppColors.baseBlackColor,
            width: 30,
          ),
        )
      ],
    );
  }

  Widget buildSignleCart() {
    return Card(
      child: Container(
        height: 200,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://kickz.akamaized.net/en/media/images/p/600/adidas_originals-3_STRIPES_T_Shirt-white_-2.jpg',
                            ),
                            // ""),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '3 nhẫn',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Hàng tiêu chuẩn",
                            style: TextStyle(
                              color: AppColors.baseDarkPinkColor,
                            ),
                          ),
                          Text(
                            "400000 VNĐ",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "800000 VNĐ",
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.baseGrey50Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.baseGrey30Color,
                        child: Icon(
                          Icons.check,
                          color: AppColors.baseWhiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: AppColors.baseWhiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      hint: Text(
                        "Kích Thước",
                        style: DetailScreenStylies.productDropDownValueStyle,
                      ),
                      value: sizeController,
                      items: ["10", "11", "12", "13"]
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          sizeController = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: AppColors.baseWhiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      hint: Text(
                        "Màu Sắc",
                        style: DetailScreenStylies.productDropDownValueStyle,
                      ),
                      value: colorsController,
                      items: ["Bạc", "Vàng", "Bạch Kim"]
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          colorsController = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: AppColors.baseWhiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      hint: Text(
                        "Số lượng",
                        style: DetailScreenStylies.productDropDownValueStyle,
                      ),
                      value: quantityController,
                      items: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          quantityController = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double orderAmout = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Giỏ hàng của bạn",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.baseBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Bạn có 3 sản phẩm",
                  style: TextStyle(
                    color: AppColors.baseGrey60Color,
                  ),
                ),
                buildSignleCart(),
                buildSignleCart(),
                buildSignleCart(),
                buildSignleCart(),
                buildSignleCart(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: AppColors.basewhite60Color,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "213132154",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseBlackColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          elevation: 0,
                          height: 40,
                          color: AppColors.baseLightOrangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: BorderSide.none,
                          ),
                          child: Text(
                            "Thuê",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.baseWhiteColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Số lượng đơn đặt",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số tiền giảm giá của bạn",
                        style: TextStyle(
                          color: AppColors.baseBlackColor,
                        ),
                      )
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 9,),
                      Text(
                        "193000 VNĐ",
                        style: TextStyle(
                          
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "-500000 VNĐ",
                        style: TextStyle(
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: RoundedButton(
                    //color: AppColors.baseDarkPinkColor,
                    title: "Thanh Toán",
                    onTap: () {
                      PageRouting.goToNextPage(
                        context: context,
                        navigateTo: PaymentScreen(),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
