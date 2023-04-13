import 'package:app_trang_suc/Screens/confirmation/confirmation.dart';
import 'package:app_trang_suc/Screens/payment/components/payment_text_formfield.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatelessWidget {
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.plus,
            color: AppColors.baseBlackColor,
            width: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.delete,
            color: AppColors.baseBlackColor,
            width: 25,
          ),
        )
      ],
    );
  }

  Widget buildTextField({
    double? leftPadding,
    double? rightPadding,
    String? hintText,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        top: 20,
        left: leftPadding!,
        right: rightPadding!,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thanh Toán",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Mã Hóa Đơn Của Bạn Là 1235462412",
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.baseGrey50Color,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 180,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: SweepGradient(
                      center: AlignmentDirectional(1, -1),
                      startAngle: 1.7,
                      endAngle: 3,
                      colors: const <Color>[
                        Color(0xff148535),
                        Color(0xff148535),
                        Color(0xff0D6630),
                        Color(0xff0D6630),
                        Color(0xff148535),
                        Color(0xff148535),
                      ],
                      stops: const <double>[
                        0.0,
                        0.3,
                        0.3,
                        0.7,
                        0.7,
                        1.0
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VISA",
                          style: TextStyle(
                            fontSize: 24.30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseWhiteColor,
                          ),
                        ),
                        Text(
                          "visa Electron",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseWhiteColor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "**** **** **** **** 1256",
                      style: TextStyle(
                        fontSize: 24.30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.baseWhiteColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Card holder",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Minh Thành",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Expries",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "2/21",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                  backgroundColor:
                                      AppColors.baseLightGreenColor,
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.baseWhiteColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              MyTextFromField(
                hintText: "Card holder",
                obscureText: false,
              ),
              MyTextFromField(
                hintText: "Card number",
                obscureText: false,
              ),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      hintText: "Exp",
                      leftPadding: 20,
                      rightPadding: 0,
                    ),
                  ),
                  Expanded(
                    child: buildTextField(
                      hintText: "CVV",
                      leftPadding: 3,
                      rightPadding: 10,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: AppColors.baseLightOrangeColor,
                          onSurface: Colors.grey,
                        ),
                        icon: SvgPicture.asset(
                          SvgImages.plus,
                          color: AppColors.baseWhiteColor,
                          width: 20,
                        ),
                        label: Text(
                          "Thêm",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.baseWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: AppColors.baseGrey10Color,
                title: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Số lượng đơn đặt",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số tiền giảm giá",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "150000 VNĐ",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "-500000 VNĐ",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppColors.baseGrey10Color,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 23),
                child: RoundedButton(
                  //color: AppColors.baseDarkPinkColor,
                  title: "Xác Nhận Thanh Toán",
                  onTap: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: ConfirmationPage(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
