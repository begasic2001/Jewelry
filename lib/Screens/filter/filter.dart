import 'package:app_trang_suc/Screens/homepage/homepage.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:app_trang_suc/components/rounded_button.dart';
import 'package:app_trang_suc/components/stylies/detail_screen_stylies.dart';
import 'package:app_trang_suc/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? _ratingController;
  String? _categoryController;

  RangeValues _currentRangeValues = const RangeValues(1500000, 2500000);

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Bộ Lọc",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
    );
  }

  Widget buildExpansionTil({
    List<String>? items,
    String? title,
    String? hint,
    String? value,
  }) {
    return ExpansionTile(
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.baseBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: AppColors.basewhite60Color,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                iconSize: 30,
                hint: Text(
                  hint!,
                  style: DetailScreenStylies.productDropDownValueStyle,
                ),
                value: value,
                items: items!
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  setState(
                    () {
                      value = value!;
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildListTile({required String title}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.baseBlackColor,
        ),
      ),
    );
  }

  Widget buildSizeGuides(
      {String? text, bool containerColor = false, Color? color}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor ? color : AppColors.baseGrey10Color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: containerColor
          ? Container()
          : Text(
              text!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget buildPriceExpansionTile() {
    return ExpansionTile(
      title: const Text(
        "Giá",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.baseBlackColor,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              RangeSlider(
                values: _currentRangeValues,
                min: 1000000,
                max: 30000000,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_currentRangeValues.start.toInt()}".toVND(unit: 'đ'),
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                    ),
                  ),
                  Text(
                    "${_currentRangeValues.end.toInt()}".toVND(unit: 'đ'),
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildListTile(
            title: "Phổ biến",
          ),
          Divider(),
          buildListTile(
            title: "Sản phẩm mới",
          ),
          Divider(),
          buildListTile(
            title: "Giá:\t Cao - Thấp",
          ),
          Divider(),
          buildListTile(
            title: "Giá:\t Thấp - Cao",
          ),
          Divider(),
          buildExpansionTil(
            value: _ratingController,
            items: [
              "Nữ",
              "Nam",
              "Trẻ Em",
            ],
            hint: "Giới Tính",
            title: "Giới Tính",
          ),
          Divider(),
          buildExpansionTil(
            value: _categoryController,
            items: [
              "Nhẫn",
              "Vòng Tay",
              "Bông Tay",
            ],
            hint: "Danh Mục",
            title: "Danh Mục",
          ),
          Divider(),
          ExpansionTile(
            title: const Text(
              "Kích Thước",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      text: "6",
                    ),
                    buildSizeGuides(
                      text: "7",
                    ),
                    buildSizeGuides(
                      text: "8",
                    ),
                    buildSizeGuides(
                      text: "9",
                    ),
                    buildSizeGuides(
                      text: "10",
                    ),
                    buildSizeGuides(
                      text: "11",
                    ),
                    buildSizeGuides(
                      text: "12",
                    ),
                    buildSizeGuides(
                      text: "13",
                    ),
                    buildSizeGuides(
                      text: "14",
                    ),
                    buildSizeGuides(
                      text: "15",
                    ),
                    buildSizeGuides(
                      text: "16",
                    ),
                    buildSizeGuides(
                      text: "17",
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(),
          ExpansionTile(
            title: const Text(
              "Màu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      color: AppColors.baseDarkPinkColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: Colors.yellow,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: Colors.green,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: Colors.pinkAccent,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: Colors.yellowAccent,
                      containerColor: true,
                    ),
                  ],
                ),
              )
            ],
          ),
          buildPriceExpansionTile(),
          Container(
            margin: EdgeInsets.all(20.0),
            child:  RoundedButton(
              //color: AppColors.baseDarkPinkColor,
              title: "Xem Sản Phẩm Khác",
              onTap: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: HomePage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
