class CartModel {
  String? productImage;

  String? productName;

  int? productPrice;

  int? productQuantity;
  int? totalPrice;
  CartModel(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.productQuantity,
      this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];

    productName = json['productName'];

    productPrice = json['productPrice'];

    productQuantity = json['productQuantity'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;

    data['productName'] = this.productName;

    data['productPrice'] = this.productPrice;

    data['productQuantity'] = this.productQuantity;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}
