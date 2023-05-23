import 'dart:async';
import 'dart:convert';

import 'package:app_trang_suc/Screens/details/detail.dart';
import 'package:app_trang_suc/Screens/filter/filter.dart';
import 'package:app_trang_suc/Screens/homepage/components/singleProduct_widget.dart';
import 'package:app_trang_suc/Screens/tabbar/tabbar_data.dart';
import 'package:app_trang_suc/Screens/yourcart/cart_detail.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/stylies/home_screen_stylies.dart';
import 'package:app_trang_suc/data/home_page_data.dart';
import 'package:app_trang_suc/main.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/models/cart_model.dart';
import 'package:app_trang_suc/models/order_model.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app_trang_suc/svgimages/svg_images.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter_svg/svg.dart';

import 'components/show_all_widget.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  List<SingleProductModel> arrivalsDatas =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> ringDatas =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> accessoriesData =
      new List<SingleProductModel>.empty(growable: true);
  List<SingleProductModel> necklaceDatas =
      new List<SingleProductModel>.empty(growable: true);
  List<CartModel> carts = new List<CartModel>.empty(growable: true);
  List<SingleProductModel> allProduct =
      new List<SingleProductModel>.empty(growable: true);
  bool searchState = false;

  final user = FirebaseAuth.instance.currentUser!;
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
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseLightOrangeColor,
        tabs: [
          Text("Tất Cả"),
          Text("Nhẫn"),
          Text("Vòng Cổ"),
          Text("Hoa Tai"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: !searchState
          ? Column(children: const [
              Text(
                "WELCOME",
                style: HomeScreenStylies.appBarUpperTitleStylies,
              ),
              Text(
                "JEWELRY",
                style: HomeScreenStylies.appBarBottomTitleStylies,
              )
            ])
          : TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Tìm kiếm.........",
                  hintStyle: TextStyle(color: Colors.black)),
              onChanged: (text) {
                SearchProduct(text);
              },
            ),
      actions: [
        !searchState
            ? IconButton(
                onPressed: () {
                  setState(() {
                    searchState = !searchState;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))
            : IconButton(
                onPressed: () {
                  setState(() {
                    searchState = !searchState;
                  });
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.black,
                )),
        // IconButton(
        //   icon: RotationTransition(
        //     turns: AlwaysStoppedAnimation(90 / 360),
        //     child: SvgPicture.asset(
        //       SvgImages.filter,
        //       width: 30,
        //     ),
        //   ),
        //   onPressed: () {
        //     PageRouting.goToNextPage(
        //       context: context,
        //       navigateTo: FilterScreen(),
        //     );
        //   },
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: StreamBuilder(
            stream: FirebaseDatabase.instance
                .ref()
                .child('Cart')
                .child(user.uid)
                .onValue,
            builder: (context, AsyncSnapshot snapshot) {
              var numberItemInCart = 0;
              if (snapshot.hasData) {
                var map = snapshot.data.snapshot.value;
                carts.clear();
                if (map != null) {
                  map.forEach((key, value) {
                    var cartModel =
                        CartModel.fromJson(json.decode(json.encode(value)));
                    carts.add(cartModel);
                  });
                  numberItemInCart = carts
                      .map<int>((c) => c.productQuantity!)
                      .reduce((a, b) => a + b);
                }

                return GestureDetector(
                  onTap: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: CartDetail(),
                    );
                  },
                  child: Center(
                      child: badges.Badge(
                    showBadge: true,
                    badgeContent: Text(
                      '${numberItemInCart > 9 ? 9.toString() + "+" : numberItemInCart.toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  )),
                );
              } else {
                return Center(
                  child: badges.Badge(
                      showBadge: true,
                      badgeContent: Text(
                        '0',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )),
                );
              }
            },
          ),
        )
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
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_v7xztojsRlhEzFI-ForOHDk31N4JZX_cTw&usqp=CAU"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_v7xztojsRlhEzFI-ForOHDk31N4JZX_cTw&usqp=CAU",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtsHQgaTbUpnE03Whqrts0xKxr8jV70zpJbA&usqp=CAU",
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
    String? productPrice,
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
  void initState() {
    getRingDatas();
    getaccessoriesDatas();
    getnecklaceDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetArrivalData();

    if (allProduct.length > 0) {
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
                  //ShowAllWidget(leftText: "Hàng Mới Về"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: allProduct.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        var arrivalDataStore = allProduct[index];
                        return SingleProductWidget(
                          productImage: arrivalDataStore.productImage,
                          productName: arrivalDataStore.productName,
                          productModel: arrivalDataStore.productModel,
                          productPrice: arrivalDataStore.productPrice,
                          productOldPrice: arrivalDataStore.productOldPrice,
                          onTap: () => {
                            PageRouting.goToNextPage(
                                context: context,
                                navigateTo:
                                    DetailScreen(data: arrivalDataStore))
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              TabBarBar(
                productData: ringDatas,
              ),
              TabBarBar(
                productData: necklaceDatas,
              ),
              TabBarBar(
                productData: accessoriesData,
              ),
            ],
          ),
        ),
      );
    }
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
                    itemCount: arrivalsDatas.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      var arrivalDataStore = arrivalsDatas[index];
                      var myKey = arrivalDataStore.key;
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
                      'https://product.hstatic.net/1000112469/product/btbkc032_6_21b8019e5d7c4ec493200a2d2e9fcfd2.png',
                  productModel: 'Bông Tai',
                  productName: 'BTBKC 032',
                  productPrice: "3967000".toVND(unit: 'đ'),
                ),
                buildTrendingProduct(
                  productImage:
                      'https://product.hstatic.net/1000112469/product/bt402_6_ec1d719e62294c4cacfe35aea9213323.png',
                  productModel: 'Bông Tai',
                  productName: 'BT 402',
                  productPrice: "1409000".toVND(unit: 'đ'),
                ),
                buildTrendingProduct(
                  productImage:
                      'https://product.hstatic.net/1000112469/product/btptb334_6__1__cut_8dbaa6b8a4d44be9a9326256f33feb6e.png',
                  productModel: 'Bông Tai',
                  productName: 'BTPTB 334',
                  productPrice: "3967000".toVND(unit: 'đ'),
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
                    itemCount: arrivalsDatas.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      //var historyDataStore = shoesData[index];
                      var arrivalDataStore = arrivalsDatas[index];
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
              productData: ringDatas,
            ),
            TabBarBar(
              productData: necklaceDatas,
            ),
            TabBarBar(
              productData: accessoriesData,
            ),
          ],
        ),
      ),
    );
  }

  void GetArrivalData() {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('arrivals');
    dbRef.onValue.listen((event) {
      setState(() {
        final map = event.snapshot.value as Map<dynamic, dynamic>;
        arrivalsDatas.clear();

        map.forEach((key, value) {
          var arrivalSingleProductModel =
              SingleProductModel.fromJson(json.decode(json.encode(value)));
          arrivalSingleProductModel.key = key;
          arrivalsDatas.add(arrivalSingleProductModel);
        });
        //arrivalsDatas
      });
    });
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
        setState(() {
          ringDatas = tempData;
        });
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

  void SearchProduct(String text) {
    DatabaseReference searchRef =
        FirebaseDatabase.instance.ref().child('AllData');
    List<SingleProductModel> tempData = [];
    searchRef.once().then((value) {
      allProduct.clear();
      var map = value.snapshot.value as Map<dynamic, dynamic>;
      // var keys = value.snapshot.key as Map<dynamic, dynamic>;
      // ignore: unused_local_variable
      map.forEach((key, value) {
        var searchData =
            new SingleProductModel.fromJson(json.decode(json.encode(value)));

        SingleProductModel data = SingleProductModel(
            productName: searchData.productName,
            productPrice: searchData.productPrice,
            productModel: searchData.productModel,
            productOldPrice: searchData.productOldPrice,
            productFourImage: searchData.productFourImage,
            productSecondImage: searchData.productSecondImage,
            productThirdImage: searchData.productThirdImage,
            productImage: searchData.productImage,
            key: searchData.key);
        if (data.productName!.toLowerCase().contains(text.toLowerCase())) {
          data.key = key;
          tempData.add(data);
          setState(() => allProduct = tempData);
        }
        Timer(Duration(seconds: 2), () {
          setState(() {});
        });
      });
    });
  }
}
