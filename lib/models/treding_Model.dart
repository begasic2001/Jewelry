class TrendingModel {
  String? productImage;
  String? productModel;
  String? productName;
  double? productPrice;

  TrendingModel(
      {this.productImage,
      this.productModel,
      this.productName,
      this.productPrice});

  TrendingModel.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];
    productModel = json['productModel'];
    productName = json['productName'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;
    data['productModel'] = this.productModel;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    return data;
  }
}
