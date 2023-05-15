import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
class SingleProductWidget extends StatelessWidget {
  final String? productImage;
  final String? productName;
  final String? productModel;
  final int? productPrice;
  final int? productOldPrice;
  final VoidCallback? onTap;
  SingleProductWidget({
    this.productImage,
    this.productName,
    this.productModel,
    this.productPrice,
    this.productOldPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  width: double.infinity - 9,
                  decoration: BoxDecoration(
                    color: AppColors.baseGrey10Color,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productImage!),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: AppColors.baseDarkOrangeColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      productName!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      productModel!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.baseDarkPinkColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                          "${productPrice!.toInt()}".toVND(unit: 'đ'),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${productOldPrice!.toInt()}".toVND(unit: 'đ'),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
