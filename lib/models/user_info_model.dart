class UserInfoModel {
  String? accessToken;
  String? tokenType;
  User? user;

  UserInfoModel({this.accessToken, this.tokenType, this.user});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? companyGroup;
  Null? store;
  Null? region;
  int? permissionGroup;
  int? enabled;
  Null? position;
  Null? eventIds;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.companyGroup,
      this.store,
      this.region,
      this.permissionGroup,
      this.enabled,
      this.position,
      this.eventIds});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyGroup = json['company_group'];
    store = json['store'];
    region = json['region'];
    permissionGroup = json['permission_group'];
    enabled = json['enabled'];
    position = json['position'];
    eventIds = json['event_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_group'] = this.companyGroup;
    data['store'] = this.store;
    data['region'] = this.region;
    data['permission_group'] = this.permissionGroup;
    data['enabled'] = this.enabled;
    data['position'] = this.position;
    data['event_ids'] = this.eventIds;
    return data;
  }
}
