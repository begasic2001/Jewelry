class OrderModel {
  String? productImage;
  String? productName;
  int? productPrice;
  int? productQuantity;
  int? totalPrice;
  String? key;
  String? date_order;
  OrderModel(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.productQuantity,
      this.totalPrice,
      this.key ,
      this.date_order 
    });

  OrderModel.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];

    productName = json['productName'];

    productPrice = json['productPrice'];

    productQuantity = json['productQuantity'];
    totalPrice = json['totalPrice'];
    key = json['key'];
    date_order = json['date_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;

    data['productName'] = this.productName;

    data['productPrice'] = this.productPrice;

    data['productQuantity'] = this.productQuantity;
    data['totalPrice'] = this.totalPrice;
    data['key']= this.key;
    data['date_order'] = this.date_order;
    return data;
  }
}
