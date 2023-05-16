class SingleProductModel {
  String? productImage;
  String? productModel;
  String? productName;
  int? productOldPrice;
  int? productPrice;
  String? productFourImage;
  String? productSecondImage;
  String? productThirdImage;
  String? key;
  SingleProductModel(
      {this.productImage,
      this.productModel,
      this.productName,
      this.productOldPrice,
      this.productPrice,
      this.productFourImage,
      this.productSecondImage,
      this.productThirdImage,
      this.key
      });

  SingleProductModel.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];
    productModel = json['productModel'];
    productName = json['productName'];
    productOldPrice = json['productOldPrice'];
    productPrice = json['productPrice'];
    productFourImage = json['productFourImage'];
    productSecondImage = json['productSecondImage'];
    productThirdImage = json['productThirdImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;
    data['productModel'] = this.productModel;
    data['productName'] = this.productName;
    data['productOldPrice'] = this.productOldPrice;
    data['productPrice'] = this.productPrice;
    data['productFourImage'] = this.productFourImage;
    data['productSecondImage'] = this.productSecondImage;
    data['productThirdImage'] = this.productThirdImage;
    data['key']=this.key;
    return data;
  }
}
