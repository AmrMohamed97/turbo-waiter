// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDetailsModel _$TicketDetailsModelFromJson(Map<String, dynamic> json) =>
    TicketDetailsModel(
      attendee: json['attendee'] == null
          ? null
          : Attendee.fromJson(json['attendee'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      lastUpdatedOn: json['lastUpdatedOn'] == null
          ? null
          : DateTime.parse(json['lastUpdatedOn'] as String),
      groupTitle: json['groupTitle'] as String?,
      typeName: json['typeName'] as String?,
      statusName: json['statusName'] as String?,
      totalPrice: json['totalPrice'] as num?,
      reservationId: json['reservationId'] as num?,
      attendeeInfoId: json['attendeeInfoId'],
      typeId: json['typeId'] as num?,
      groupId: json['groupId'] as num?,
      price: json['price'] as num?,
      currency: json['currency'] as String?,
      notes: json['notes'] as String?,
      title: json['title'] as String?,
      titleNumber: json['titleNumber'] as String?,
      statusId: json['statusId'] as num?,
    );

Map<String, dynamic> _$TicketDetailsModelToJson(TicketDetailsModel instance) =>
    <String, dynamic>{
      'attendee': instance.attendee,
      'id': instance.id,
      'createdOn': instance.createdOn?.toIso8601String(),
      'lastUpdatedOn': instance.lastUpdatedOn?.toIso8601String(),
      'groupTitle': instance.groupTitle,
      'typeName': instance.typeName,
      'statusName': instance.statusName,
      'totalPrice': instance.totalPrice,
      'reservationId': instance.reservationId,
      'attendeeInfoId': instance.attendeeInfoId,
      'typeId': instance.typeId,
      'groupId': instance.groupId,
      'price': instance.price,
      'currency': instance.currency,
      'notes': instance.notes,
      'title': instance.title,
      'titleNumber': instance.titleNumber,
      'statusId': instance.statusId,
    };
