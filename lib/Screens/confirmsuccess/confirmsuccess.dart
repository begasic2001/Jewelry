import 'package:app_trang_suc/Screens/homepage/homepage.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmationSuccessPage extends StatelessWidget {
  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Success",
        style: TextStyle(
          color: AppColors.baseBlackColor,
          fontSize: 25
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.close,
            width: 30,
            color: AppColors.baseBlackColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Chúc mừng",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseBlackColor,
                          ),
                        ),
                        Text(
                          "Đơn đặt hàng đã được chấp nhận",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Đơn hàng của bạn đang trên đường",
                          style: TextStyle(
                            color: AppColors.baseGrey40Color,
                            fontSize: 20
                          ),
                        
                        ),
                        Text(
                          "và sẽ đến trong thời gian ngắn",
                          style: TextStyle(
                            color: AppColors.baseGrey40Color,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RoundedButton(
              onTap: () {
                // PageRouting.goToNextPage(
                //   context: context,
                //   navigateTo: HomePage(),
                // );
                Navigator.of(context).pop(context);
              },
              title: "Trở về trang chủ",
            ),
          ),
        ],
      ),
    );
  }
}
