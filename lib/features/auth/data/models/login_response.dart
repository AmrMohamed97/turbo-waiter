class LoginResponse {
  LoginResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  final UserData? data;
  final String? message;
  final bool? status;

  LoginResponse copyWith({UserData? data, String? message, bool? status}) {
    return LoginResponse(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "status": status,
  };

  @override
  String toString() {
    return "$data, $message, $status, ";
  }
}

class UserData {
  int? userId;
  String? message;
  bool? isAuthenticated;
  String? username;
  int? agencyId;
  num? sellerCreditLimit;
  String? role;
  String? token;
  String? expiresOn;

  UserData({
    this.userId,
    this.message,
    this.isAuthenticated,
    this.username,
    this.agencyId,
    this.sellerCreditLimit,
    this.role,
    this.token,
    this.expiresOn,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    username = json['username'];
    agencyId = json['agencyId'];
    sellerCreditLimit = json['sellerCreditLimit'];
    role = json['role'];
    token = json['token'];
    expiresOn = json['expiresOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['message'] = message;
    data['isAuthenticated'] = isAuthenticated;
    data['username'] = username;
    data['agencyId'] = agencyId;
    data['sellerCreditLimit'] = sellerCreditLimit;
    data['role'] = role;
    data['token'] = token;
    data['expiresOn'] = expiresOn;
    return data;
  }

  @override
  String toString() {
    return "$userId, $message, $isAuthenticated, $username, $agencyId, $sellerCreditLimit, $role, $token, $expiresOn, ";
  }
}
