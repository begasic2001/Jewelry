class UserModel {
  String? uid;
  String? email;
  String? password;
  String? name;
  String? address;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.address,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    password = json['password'];

    name = json['name'];

    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;

    data['password'] = this.password;

    data['name'] = this.name;

    data['address'] = this.address;
    return data;
  }
}
