import 'dart:convert';

import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<OrderModel> historyDatas = new List<OrderModel>.empty(growable: true);
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

  Widget buildConfirmationProduct(int index) {
    return Card(
      child: SizedBox(
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
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(historyDatas[index].productImage.toString()),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                historyDatas[index].productName!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                historyDatas[index].productPrice.toString(),
                                style: const TextStyle(
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
                            "Số Lượng: ${historyDatas[index].productQuantity}",
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
  void initState() {
    HistoryUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (historyDatas.isEmpty)
      return Scaffold(
        appBar: AppBar(),
        body: Text('Loading...'),
      );

    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: AppColors.baseGrey10Color,
      body: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        color: AppColors.baseWhiteColor,
        width: double.infinity,
        child: ListView.builder(
          itemCount: historyDatas.length,
          itemBuilder: (context, index) {
            return buildConfirmationProduct(index);
          },
        ),
      ),
    );
  }

  void HistoryUser() {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('Order').child(user.uid);
    List<OrderModel> tempData = [];
    ref.onValue.listen((DatabaseEvent event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      historyDatas.clear();
      map.forEach((key, value) {
        print("data history ::::::::::::");
        print("key" + key);
        ref.child(key).onValue.listen((DatabaseEvent event2) {
          final map2 = event2.snapshot.value as Map<dynamic, dynamic>;
          map2.forEach((key2, value2) {
            var historyValue = new OrderModel.fromJson(json.decode(json.encode(value2)));

            tempData.add(historyValue);
            setState(() => historyDatas = tempData);
          });
        });
      });
    });
  }
}