import 'dart:convert';

import 'package:app_trang_suc/Screens/history/components/historyProductWidget.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/models/cart_model.dart';
import 'package:app_trang_suc/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryPage extends StatefulWidget {
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final List<OrderModel> historyDatas =
      new List<OrderModel>.empty(growable: true);
  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(context),
      ),
    );
  }

  Widget buildConfirmationProduct() {
    return Card(
      child: Container(
        height: 140,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage("da"),
                            )),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "3 Nhẫn ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "150000 VNĐ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Nguyên Khối",
                                style: TextStyle(
                                  color: AppColors.baseDarkPinkColor,
                                ),
                              ),
                              Text(
                                "100000 VNĐ",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Màu Sắc:\tVàng",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseGrey60Color,
                            ),
                          ),
                          Text(
                            "Số Lượng:\tx1",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseGrey60Color,
                            ),
                          )
                        ],
                      ),
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

  @override
  Widget build(BuildContext context) {
    HistoryUser();
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: AppColors.baseGrey10Color,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Có 2 đơn hàng",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // StreamBuilder(
                //   stream: ,
                //   builder: (context,AsyncSnapshot snapshot){

                // });
                // ListView.builder(itemBuilder: )
                buildConfirmationProduct(
                  
                ),
              ],
            ),
          ),
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
        print("data history ::::::::::::");
        print("key" + key);
        ref.child(key).onValue.listen((DatabaseEvent event2) {
          final map2 = event2.snapshot.value as Map<dynamic, dynamic>;
          map2.forEach((key2, value2) {
            print("data history ::::::::::::");
            print("key" + key2);
            var historyValue =
                new OrderModel.fromJson(json.decode(json.encode(value2)));
            historyDatas.add(historyValue);
          });
        });
      });
    });
  }
}
