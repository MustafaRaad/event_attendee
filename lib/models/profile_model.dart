class ProfileModel {
  late List<ProfileInfoModel> data;

  ProfileModel({required this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProfileInfoModel>[];
      json['data'].forEach((v) {
        data.add(ProfileInfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileInfoModel {
  late int id;
  late String name;
  late String price;
  late String cost;
  late String userPrice;

  ProfileInfoModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.cost,
      required this.userPrice});

  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    cost = json['cost'];
    userPrice = json['user_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['cost'] = cost;
    data['user_price'] = userPrice;
    return data;
  }
}
