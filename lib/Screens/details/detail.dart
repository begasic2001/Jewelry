import 'package:app_trang_suc/Screens/details/components/drop_button.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/Screens/sizeguide/sizeguide.dart';
import 'package:app_trang_suc/Screens/yourcart/your_cart_screen.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/stylies/detail_screen_stylies.dart';
import 'package:app_trang_suc/data/detail_screen_data.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
  final SingleProductModel data;

  DetailScreen({required this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? _ratingController;
  String? _sizeController;

  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Jewelry",
          style: TextStyle(
            color: AppColors.baseBlackColor,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              SvgImages.heart,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Favo",
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              SvgImages.upload,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Favo",
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  buildListTile() {
    return ListTile(
      leading: const CircleAvatar(
        radius: 35,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
          'https://i2.wp.com/www.logotaglines.com/wp-content/uploads/2018/04/Reebok-new-logo.png?resize=489%2C480&ssl=1',
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productName!,
            overflow: TextOverflow.ellipsis,
            style: DetailScreenStylies.commpanyTitleStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productModel!,
            style: DetailScreenStylies.productModelStyle,
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productPrice.toString(),
            style: DetailScreenStylies.productPriceStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productOldPrice.toString(),
            style: DetailScreenStylies.productOldPriceStyle,
          ),
        ],
      ),
    );
  }

  buildProductImages() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.data.productImage!,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  child: Image.network(widget.data.productSecondImage!),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  child: Image.network(widget.data.productThirdImage!),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  child: Image.network(
                    widget.data.productFourImage!,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildColorsAndSize() {
    return Row(
      children: [
        Expanded(
          child: DropButton(
            hintText: "Màu",
            item: ["Bạc", "Vàng", "Bạch Kim"],
            ratingController: _ratingController,
          ),
        ),
        Expanded(
          child: DropButton(
            hintText: "Kích Cỡ",
            item: [
              "6",
              "7",
              "8",
              "9",
              "10",
              "11",
              "12",
              "13",
              "14",
              "15",
              "16",
              "17"
            ],
            ratingController: _sizeController,
          ),
        )
      ],
    );
  }

  buildExpensionTileRow({String? firstTitle, String? secTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstTitle!,
          semanticsLabel: ".\t\Chất Liệu",
          style: TextStyle(
            fontSize: 18.60,
          ),
        ),
        Text(
          secTitle!,
          semanticsLabel: "84%\tVàng",
          style: TextStyle(
            fontSize: 18.60,
          ),
        ),
      ],
    );
  }

  buildExpensionTile() {
    return ExpansionTile(
      title: Text(
        "Mô Tả",
        style: DetailScreenStylies.descriptionTextStyle,
      ),
      children: [
        ListTile(
          title: Wrap(
            children: [
              Text(
                "Mô Tả Chi Tiết Sản Phẩm",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Column(
                children: [
                  buildExpensionTileRow(
                    firstTitle: '.\t\Chất liệu',
                    secTitle: "84%\tVàng",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "16% mix",
                        style: TextStyle(
                          fontSize: 18.60,
                        ),
                      ),
                    ],
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\Kích thước",
                    secTitle: "10,\t11, \t12,\t13, \t14",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\Giới tính",
                    secTitle: "Nữ",
                  ),
                  MaterialButton(
                    height: 55,
                    elevation: 0,
                    child: Text(
                      "Hướng dân kích thước",
                      style: DetailScreenStylies.sizeGruideTextStyle,
                    ),
                    minWidth: double.infinity,
                    color: AppColors.basewhite60Color,
                    onPressed: () {
                      PageRouting.goToNextPage(
                        context: context,
                        navigateTo: SizeGuideScreen(),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  buildAddtoCart() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: MaterialButton(
        elevation: 0,
        height: 50,
        color: AppColors.baseLightOrangeColor,
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Thêm Vào Giỏ",
          style: DetailScreenStylies.buttonTextStyle,
        ),
        onPressed: () {
          PageRouting.goToNextPage(
            context: context,
            navigateTo: YourCartScreen(),
          );
        },
      ),
    );
  }

  buildBottomGridView() {
    return Container(
      height: 260,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: true,
        itemCount: detailScreenData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          var data = detailScreenData[index];
          return SingleProductWidget(
            onTap: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: DetailScreen(
                  data: data,
                ),
              );
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

  buildMayLikeYou() {
    return ListTile(
      leading: Text(
        "Sản Phẩm Khác",
        style: DetailScreenStylies.youmayalsolikeTextStyle,
      ),
      trailing: Text(
        "Xem Tất Cả",
        style: DetailScreenStylies.showAllTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildListTile(),
          buildProductImages(),
          buildColorsAndSize(),
          buildAddtoCart(),
          buildExpensionTile(),
          buildMayLikeYou(),
          buildBottomGridView(),
        ],
      ),
    );
  }
}
