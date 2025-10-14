import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attende_model.g.dart';

@JsonSerializable()
class Attendee extends Equatable {
  const Attendee({
    required this.id,
    required this.createdOn,
    required this.lastUpdatedOn,
    required this.genderName,
    required this.isActive,
    required this.name,
    required this.gender,
    required this.age,
    required this.phone,
    required this.email,
    required this.isWhatsApp,
    required this.isEmail,
  });

  final int id;
  final DateTime? createdOn;
  final dynamic lastUpdatedOn;
  final String? genderName;
  final bool? isActive;
  final String? name;
  final num? gender;
  final num? age;
  final String? phone;
  final String? email;
  final bool? isWhatsApp;
  final bool? isEmail;

  Attendee copyWith({
    int? id,
    DateTime? createdOn,
    dynamic lastUpdatedOn,
    String? genderName,
    bool? isActive,
    String? name,
    num? gender,
    num? age,
    String? phone,
    String? email,
    bool? isWhatsApp,
    bool? isEmail,
  }) {
    return Attendee(
      id: id ?? this.id,
      createdOn: createdOn ?? this.createdOn,
      lastUpdatedOn: lastUpdatedOn ?? this.lastUpdatedOn,
      genderName: genderName ?? this.genderName,
      isActive: isActive ?? this.isActive,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isWhatsApp: isWhatsApp ?? this.isWhatsApp,
      isEmail: isEmail ?? this.isEmail,
    );
  }

  factory Attendee.fromJson(Map<String, dynamic> json) =>
      _$AttendeeFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeToJson(this);

  @override
  String toString() {
    return "$id, $createdOn, $lastUpdatedOn, $genderName, $isActive, $name, $gender, $age, $phone, $email, $isWhatsApp, $isEmail, ";
  }

  @override
  List<Object?> get props => [
    id,
    createdOn,
    lastUpdatedOn,
    genderName,
    isActive,
    name,
    gender,
    age,
    phone,
    email,
    isWhatsApp,
    isEmail,
  ];
}
