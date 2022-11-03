class AuthenticationData {
  String id;
  String accesstoken;
  String tokentype;
  String email;
  String name;

  AuthenticationData(
      {required this.id,
      required this.accesstoken,
      required this.tokentype,
      required this.email,
      required this.name});

  factory AuthenticationData.fromJson(Map<String, dynamic> json) {
    return AuthenticationData(
        id: json['id'],
        accesstoken: json['accesstoken'],
        tokentype: json['tokentype'],
        email: json['email'],
        name: json['name']);
  }

  factory AuthenticationData.fromStoreJson(Map<String, dynamic> json) {
    return AuthenticationData(
      id: json['id'],
      accesstoken: json['accesstoken'],
      tokentype: json['tokentype'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accesstoken': accesstoken,
      'tokentype': tokentype,
      'email': email,
      'name': name
    };
  }
}
