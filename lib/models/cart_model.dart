class CartModel {
  String? productImage;
  String? productModel;
  String? productName;
  double? productOldPrice;
  double? productPrice;
  String? productColor;
  String? productQuantity;
  String? productSize;

  CartModel(
      {this.productImage,
      this.productModel,
      this.productName,
      this.productOldPrice,
      this.productPrice,
      this.productColor,
      this.productQuantity,
      this.productSize});

  CartModel.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];
    productModel = json['productModel'];
    productName = json['productName'];
    productOldPrice = json['productOldPrice'];
    productPrice = json['productPrice'];
    productColor = json['productColor'];
    productQuantity = json['productQuantity'];
    productSize = json['productSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;
    data['productModel'] = this.productModel;
    data['productName'] = this.productName;
    data['productOldPrice'] = this.productOldPrice;
    data['productPrice'] = this.productPrice;
    data['productColor'] = this.productColor;
    data['productQuantity'] = this.productQuantity;
    data['productSize'] = this.productSize;
    return data;
  }
}
