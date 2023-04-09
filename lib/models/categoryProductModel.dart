class CategoryProductModel {
  String? productImage;
  String? productModel;
  String? productName;

  CategoryProductModel({this.productImage, this.productModel, this.productName});

  CategoryProductModel.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];
    productModel = json['productModel'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productImage'] = this.productImage;
    data['productModel'] = this.productModel;
    data['productName'] = this.productName;
    return data;
  }
}
