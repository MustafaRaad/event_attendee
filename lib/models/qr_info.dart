class QrInfoGetter {
  int data;
  int status;
  String message;

  QrInfoGetter({
    required this.data,
    required this.status,
    required this.message,
  });

  factory QrInfoGetter.fromJson(Map<String, dynamic> json) {
    return QrInfoGetter(
      data: json['data'],
      status: json['status'],
      message: json['message'],
    );
  }

  factory QrInfoGetter.fromStoreJson(Map<String, dynamic> json) {
    return QrInfoGetter(
      data: json['data'],
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'status': status,
      'message': message,
    };
  }
}
