import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:turbo_waiter/features/ticket_details/data/models/ticket_details.dart';

part 'ticket_response_model.g.dart';

@JsonSerializable()
class TicketResponseModel extends Equatable {
  const TicketResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final TicketDetailsModel? data;
  final String message;
  final bool status;

  TicketResponseModel copyWith({
    TicketDetailsModel? data,
    String? message,
    bool? status,
  }) {
    return TicketResponseModel(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  factory TicketResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResponseModelToJson(this);

  @override
  String toString() {
    return "$data, $message, $status, ";
  }

  @override
  List<Object?> get props => [data, message, status];
}

/*
{
	"data": {
		"attendee": {
			"id": 45,
			"createdOn": "2025-10-03T10:58:27.7899443",
			"lastUpdatedOn": null,
			"genderName": "أنثى",
			"isActive": true,
			"name": "Mohamed Abdelaziz Nosair",
			"gender": 1,
			"age": 20,
			"phone": "",
			"email": "mohamednosser12345@gmail.com",
			"isWhatsApp": false,
			"isEmail": true
		},
		"id": 23,
		"createdOn": "2025-10-01T18:38:30.36288",
		"lastUpdatedOn": "2025-10-03T11:37:22.2859176",
		"groupTitle": "initial",
		"typeName": "",
		"statusName": "",
		"totalPrice": 213,
		"reservationId": 42,
		"attendeeInfoId": null,
		"typeId": 0,
		"groupId": 28,
		"price": 200,
		"currency": "USD",
		"notes": "",
		"title": "تذكره حفله وحشتينى",
		"titleNumber": "11",
		"statusId": 0
	},
	"message": "تمت العمليه بنجاح",
	"status": true
}*/
