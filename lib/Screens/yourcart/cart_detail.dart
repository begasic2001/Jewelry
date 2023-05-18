import 'dart:convert';

import 'package:app_trang_suc/Screens/confirmsuccess/confirmsuccess.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/components/stylies/home_screen_stylies.dart';
import 'package:app_trang_suc/models/SingleProductModel.dart';
import 'package:app_trang_suc/models/cart_model.dart';
import 'package:app_trang_suc/models/order_model.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  List<CartModel> cartModels = new List<CartModel>.empty(growable: true);
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(context),
          ),
          backgroundColor: Colors.white,
          title: Column(
            children: const [
              Text(
                "Giỏ hàng",
                style: HomeScreenStylies.appBarUpperTitleStylies,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseDatabase.instance
                  .ref()
                  .child('Cart')
                  .child(user.uid)
                  .onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var map = snapshot.data.snapshot.value;
                  cartModels.clear();
                  if (map != null) {
                    map.forEach((key, value) {
                      var cartModel =
                          CartModel.fromJson(json.decode(json.encode(value)));
                      cartModel.key = key;
                      cartModels.add(cartModel);
                    });
                  }
                  return cartModels.length > 0
                      ? ListView.builder(
                          itemCount: cartModels.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                Card(
                                  elevation: 8,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            child: Image(
                                              image: NetworkImage(
                                                cartModels[index].productImage!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: Text(
                                                      cartModels[index]
                                                          .productName!,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            '${cartModels[index].productPrice.toVND(unit: 'đ')}'),
                                                        ElegantNumberButton(
                                                          initialValue: cartModels[
                                                                  index]
                                                              .productQuantity!,
                                                          minValue: 1,
                                                          maxValue: 50,
                                                          decimalPlaces: 0,
                                                          color: Colors.white38,
                                                          onChanged:
                                                              (value) async {
                                                            cartModels[index]
                                                                    .productQuantity =
                                                                value.toInt();
                                                            cartModels[index]
                                                                .totalPrice = cartModels[
                                                                        index]
                                                                    .productQuantity! *
                                                                cartModels[
                                                                        index]
                                                                    .productPrice!;

                                                            updateCart(
                                                                scaffoldKey,
                                                                cartModels[
                                                                    index],
                                                                user.uid);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Tổng: ${cartModels[index].totalPrice.toVND(unit: 'đ')}',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.clear),

                                    onPressed: () async {
                                      // if (await confirm(context,
                                      //     title: Text('Xóa sản phẩm'),
                                      //     content: Text(
                                      //         'Bạn có muốn xóa sản phẩm này ???'),
                                      //     textOK: Text(
                                      //       'Xóa',
                                      //       style: TextStyle(color: Colors.red),
                                      //     ),
                                      //     textCancel: Text('Hủy'))) {
                                      deleteCart(scaffoldKey, cartModels[index],
                                          user.uid);
                                      //}
                                    },
                                    //     cartModels[index], user.uid,
                                    // onPressed: updateCart(scaffoldKey,
                                    //     cartModels[index], user.uid),
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      : Center(
                          child: Text('Giỏ hàng trống !!!!'),
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
            )),
            Container(
              margin: EdgeInsets.all(30),
              child: RoundedButton(
                //color: AppColors.baseDarkPinkColor,
                title: "Thanh Toán",
                onTap: () {
                  SubmitCart(scaffoldKey, cartModels, user.uid);
                },
              ),
            )
          ],
        ));
  }

  void updateCart(
      GlobalKey<ScaffoldState> scaffoldKey, CartModel data, String uid) {
    var myKey = data.key!;
    var cart = FirebaseDatabase.instance.ref().child('Cart').child(uid);
    cart
        .child(myKey)
        .set(data.toJson())
        .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext!)
            .showSnackBar(SnackBar(content: Text('Cập nhật thành công !!'))))
        .catchError((e) => {
              ScaffoldMessenger.of(scaffoldKey.currentContext!)
                  .showSnackBar(SnackBar(content: Text('${e}')))
            });
  }

  void deleteCart(
      GlobalKey<ScaffoldState> scaffoldKey, CartModel data, String uid) {
    var myKey = data.key!;
    var cart = FirebaseDatabase.instance.ref().child('Cart').child(uid);
    cart
        .child(myKey)
        .remove()
        .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext!)
            .showSnackBar(SnackBar(content: Text('Xóa thành công'))))
        .catchError((e) => {
              ScaffoldMessenger.of(scaffoldKey.currentContext!)
                  .showSnackBar(SnackBar(content: Text('${e}')))
            });
  }

  void SubmitCart(
      GlobalKey<ScaffoldState> scaffoldKey, List<CartModel> data, String uid) {
    var dbOrder = FirebaseDatabase.instance.ref().child('Order').child(uid);
    var cart = FirebaseDatabase.instance.ref().child('Cart').child(uid);

    print("Order Submit::::::::::::");
    print(data);
    //var myKey = data.key!;
    data.forEach((value) {
      var cartModel = CartModel.fromJson(json.decode(json.encode(value)));
      var productKey = cartModel.key!;
      var orderModel = OrderModel(
          productName: cartModel.productName,
          productPrice: cartModel.productPrice,
          productQuantity: cartModel.productQuantity,
          productImage: cartModel.productImage,
          totalPrice: cartModel.productPrice);

      dbOrder.child(productKey).set(orderModel.toJson()).whenComplete(() {
        cart.child(productKey).remove().whenComplete(() {
          ScaffoldMessenger.of(scaffoldKey.currentContext!)
              .showSnackBar(SnackBar(content: Text('Đặt hàng thành công')));
        }).catchError((e) => {
              ScaffoldMessenger.of(scaffoldKey.currentContext!)
                  .showSnackBar(SnackBar(content: Text('${e}')))
            });
      });
    });

    PageRouting.goToNextPage(
        context: context, navigateTo: ConfirmationSuccessPage());
    // var cart = FirebaseDatabase.instance.ref().child('Cart').child(uid);
    // cart.onValue.listen((DatabaseEvent event) {
    //   var listCart = event.snapshot.value as Map<dynamic, dynamic>;
    //   listCart.forEach((key, value) {
    //     var cartModel = CartModel.fromJson(json.decode(json.encode(value)));
    //     if (cartModel != null) {
    //       var orderModel = new OrderModel(
    //           productName: cartModel.productName,
    //           productPrice: cartModel.productPrice,
    //           productQuantity: cartModel.productQuantity,
    //           productImage: cartModel.productImage,
    //           totalPrice: cartModel.productPrice);
    //       cart.child(key).set(cartModel.toJson());
    //     }
    //   });
    // });

    // cart
    //     .child(myKey)
    //     .set(cartModel.toJson())
    //     .then((value) => ScaffoldMessenger.of(scaffoldKey.currentContext!)
    //         .showSnackBar(SnackBar(content: Text('Đã thêm vào giỏ hàng'))))
    //     .catchError((e) => {
    //           ScaffoldMessenger.of(scaffoldKey.currentContext!)
    //               .showSnackBar(SnackBar(content: Text('${e}')))
    //         });
  }
}
