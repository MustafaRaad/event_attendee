class ProfileModel {
  Data? data;
  String? message;
  int? status;

  ProfileModel({this.data, this.message, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  int? eventId;
  String? reference;
  int? organizationId;
  String? qrCodeUrl;
  String? nameFirst;
  String? nameSecond;
  String? nameLast;
  String? attendCarType;
  String? attendCarNumber;
  String? attendCarCompanion1;
  Null? attendCarCompanion2;
  Null? attendCarCompanion3;
  String? email;
  String? phone;
  String? country;
  String? governorate;
  Null? salutation;
  String? title;
  String? specialty;
  Null? subSpecialty;
  String? department;
  String? facility;
  String? type;
  String? status;
  Null? attendHours;
  int? attendStatus;
  String? attendAt;
  int? attendByUser;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? printCertiAt;
  Null? printBadgeAt;

  Data(
      {this.id,
      this.eventId,
      this.reference,
      this.organizationId,
      this.qrCodeUrl,
      this.nameFirst,
      this.nameSecond,
      this.nameLast,
      this.attendCarType,
      this.attendCarNumber,
      this.attendCarCompanion1,
      this.attendCarCompanion2,
      this.attendCarCompanion3,
      this.email,
      this.phone,
      this.country,
      this.governorate,
      this.salutation,
      this.title,
      this.specialty,
      this.subSpecialty,
      this.department,
      this.facility,
      this.type,
      this.status,
      this.attendHours,
      this.attendStatus,
      this.attendAt,
      this.attendByUser,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.printCertiAt,
      this.printBadgeAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    reference = json['reference'];
    organizationId = json['organization_id'];
    qrCodeUrl = json['qr_code_url'];
    nameFirst = json['name_first'];
    nameSecond = json['name_second'];
    nameLast = json['name_last'];
    attendCarType = json['attend_car_type'];
    attendCarNumber = json['attend_car_number'];
    attendCarCompanion1 = json['attend_car_companion_1'];
    attendCarCompanion2 = json['attend_car_companion_2'];
    attendCarCompanion3 = json['attend_car_companion_3'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    governorate = json['governorate'];
    salutation = json['salutation'];
    title = json['title'];
    specialty = json['specialty'];
    subSpecialty = json['sub_specialty'];
    department = json['department'];
    facility = json['facility'];
    type = json['type'];
    status = json['status'];
    attendHours = json['attend_hours'];
    attendStatus = json['attend_status'];
    attendAt = json['attend_at'];
    attendByUser = json['attend_by_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    printCertiAt = json['print_certi_at'];
    printBadgeAt = json['print_badge_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['event_id'] = eventId;
    data['reference'] = reference;
    data['organization_id'] = organizationId;
    data['qr_code_url'] = qrCodeUrl;
    data['name_first'] = nameFirst;
    data['name_second'] = nameSecond;
    data['name_last'] = nameLast;
    data['attend_car_type'] = attendCarType;
    data['attend_car_number'] = attendCarNumber;
    data['attend_car_companion_1'] = attendCarCompanion1;
    data['attend_car_companion_2'] = attendCarCompanion2;
    data['attend_car_companion_3'] = attendCarCompanion3;
    data['email'] = email;
    data['phone'] = phone;
    data['country'] = country;
    data['governorate'] = governorate;
    data['salutation'] = salutation;
    data['title'] = title;
    data['specialty'] = specialty;
    data['sub_specialty'] = subSpecialty;
    data['department'] = department;
    data['facility'] = facility;
    data['type'] = type;
    data['status'] = status;
    data['attend_hours'] = attendHours;
    data['attend_status'] = attendStatus;
    data['attend_at'] = attendAt;
    data['attend_by_user'] = attendByUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['print_certi_at'] = printCertiAt;
    data['print_badge_at'] = printBadgeAt;
    return data;
  }
}
