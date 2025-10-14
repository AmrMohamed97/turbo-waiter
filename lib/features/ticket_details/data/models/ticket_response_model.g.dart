// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponseModel _$TicketResponseModelFromJson(Map<String, dynamic> json) =>
    TicketResponseModel(
      data: json['data'] == null
          ? null
          : TicketDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$TicketResponseModelToJson(
  TicketResponseModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'status': instance.status,
};
