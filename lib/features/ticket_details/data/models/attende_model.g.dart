// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attende_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendee _$AttendeeFromJson(Map<String, dynamic> json) => Attendee(
  id: (json['id'] as num).toInt(),
  createdOn: json['createdOn'] == null
      ? null
      : DateTime.parse(json['createdOn'] as String),
  lastUpdatedOn: json['lastUpdatedOn'],
  genderName: json['genderName'] as String?,
  isActive: json['isActive'] as bool?,
  name: json['name'] as String?,
  gender: json['gender'] as num?,
  age: json['age'] as num?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  isWhatsApp: json['isWhatsApp'] as bool?,
  isEmail: json['isEmail'] as bool?,
);

Map<String, dynamic> _$AttendeeToJson(Attendee instance) => <String, dynamic>{
  'id': instance.id,
  'createdOn': instance.createdOn?.toIso8601String(),
  'lastUpdatedOn': instance.lastUpdatedOn,
  'genderName': instance.genderName,
  'isActive': instance.isActive,
  'name': instance.name,
  'gender': instance.gender,
  'age': instance.age,
  'phone': instance.phone,
  'email': instance.email,
  'isWhatsApp': instance.isWhatsApp,
  'isEmail': instance.isEmail,
};
