
class AuthResponse {
  int? id;
  String? username;
  String? token;
  String? qr;
  ClientData? clientData;

  AuthResponse({this.id, this.username, this.token, this.qr, this.clientData});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    token = json['token'];
    qr = json['qr_code'];
    clientData =
        json['client_data'] != null
            ? ClientData.fromJson(json['client_data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['token'] = token;
    data['qr_code'] = qr;
    if (clientData != null) {
      data['client_data'] = clientData!.toJson();
    }
    return data;
  }
}

class ClientData {
  String? fullName;
  String? tradeName;
  String? taxNumber;
  String? commercialRegistrationNumber;
  String? municipalLicense;
  String? address;
  String? phone;
  String? phone2;
  String? phone3;
  String? managerName;
  int? spaceOfPlace;
  String? status;
  String? latitude;
  String? longitude;
  String? username;
  String? image;
  String? imageCommercialRegister;

  ClientData({
    this.fullName,
    this.tradeName,
    this.taxNumber,
    this.commercialRegistrationNumber,
    this.municipalLicense,
    this.address,
    this.phone,
    this.phone2,
    this.phone3,
    this.managerName,
    this.spaceOfPlace,
    this.status,
    this.latitude,
    this.longitude,
    this.username,
    this.image,
    this.imageCommercialRegister,
  });

  ClientData.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    tradeName = json['trade_name'];
    taxNumber = json['tax_number'];
    commercialRegistrationNumber = json['commercial_registration_number'];
    municipalLicense = json['municipal_license'];
    address = json['address'];
    phone = json['phone'];
    phone2 = json['phone2'];
    phone3 = json['phone3'];
    managerName = json['manager_name'];
    spaceOfPlace = json['SpaceOfPlace'];
    status = json['status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    username = json['username'];
    image = json['image'];
    imageCommercialRegister = json['image_commercial_register'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['trade_name'] = tradeName;
    data['tax_number'] = taxNumber;
    data['commercial_registration_number'] = commercialRegistrationNumber;
    data['municipal_license'] = municipalLicense;
    data['address'] = address;
    data['phone'] = phone;
    data['phone2'] = phone2;
    data['phone3'] = phone3;
    data['manager_name'] = managerName;
    data['SpaceOfPlace'] = spaceOfPlace;
    data['status'] = status;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['username'] = username;
    data['image'] = image;
    data['image_commercial_register'] = imageCommercialRegister;

    return data;
  }
}
