import 'dart:convert';

import 'package:app_trang_suc/Screens/history/components/historyProductWidget.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/models/cart_model.dart';
import 'package:app_trang_suc/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<OrderModel> historyDatas = new List<OrderModel>.empty(growable: true);
  final user = FirebaseAuth.instance.currentUser!;
  AppBar buildAppbar() {
    return AppBar(
      title: Text("Lịch Sử",
          style: TextStyle(
            color: AppColors.baseBlackColor,
          )),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    HistoryUser();
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: AppColors.baseGrey10Color,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GridView.builder(
            shrinkWrap: true,
            primary: true,
            itemCount: historyDatas.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              var historyItems = historyDatas[index];
              return HistoryProductWidget(
                  //date_order: historyItems.date_order,
                  productImage: historyItems.productImage,
                  productName: historyItems.productName,
                  productPrice: historyItems.productPrice,
                  productQuantity: historyItems.productPrice,
                  totalPrice: historyItems.totalPrice);
            },
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 12.0,
          //   ),
          //child:
          //),
        ],
      ),
    );
  }

  void HistoryUser() {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child('Order').child(user.uid);
    ref.onValue.listen((DatabaseEvent event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      historyDatas.clear();
      map.forEach((key, value) {
        ref.child(key).onValue.listen((event2) {
          setState(() {
            final map2 = event2.snapshot.value as Map<dynamic, dynamic>;
            map2.forEach((key, value2) {
              var colothSingleProductModel =
                  new OrderModel.fromJson(json.decode(json.encode(value2)));
              colothSingleProductModel.key = key;
              historyDatas.add(colothSingleProductModel);
            });
          });
        });
      });
    });

    //  dbRef.onValue.listen((event) {
    //   setState(() {
    //     final map = event.snapshot.value as Map<dynamic, dynamic>;
    //     arrivalsDatas.clear();

    //     map.forEach((key, value) {
    //       var arrivalSingleProductModel =
    //           SingleProductModel.fromJson(json.decode(json.encode(value)));
    //       arrivalSingleProductModel.key = key;
    //       arrivalsDatas.add(arrivalSingleProductModel);
    //     });
    //     //arrivalsDatas
    //   });
    // });
  }
}
