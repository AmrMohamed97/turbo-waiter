import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:turbo_waiter/features/ticket_details/data/models/attende_model.dart';
part 'ticket_details.g.dart';

@JsonSerializable()
class TicketDetailsModel extends Equatable {
  const TicketDetailsModel({
    required this.attendee,
    required this.id,
    required this.createdOn,
    required this.lastUpdatedOn,
    required this.groupTitle,
    required this.typeName,
    required this.statusName,
    required this.totalPrice,
    required this.reservationId,
    required this.attendeeInfoId,
    required this.typeId,
    required this.groupId,
    required this.price,
    required this.currency,
    required this.notes,
    required this.title,
    required this.titleNumber,
    required this.statusId,
  });

  final Attendee? attendee;
  final int? id;
  final DateTime? createdOn;
  final DateTime? lastUpdatedOn;
  final String? groupTitle;
  final String? typeName;
  final String? statusName;
  final num? totalPrice;
  final num? reservationId;
  final dynamic attendeeInfoId;
  final num? typeId;
  final num? groupId;
  final num? price;
  final String? currency;
  final String? notes;
  final String? title;
  final String? titleNumber;
  final num? statusId;

  TicketDetailsModel copyWith({
    Attendee? attendee,
    int? id,
    DateTime? createdOn,
    DateTime? lastUpdatedOn,
    String? groupTitle,
    String? typeName,
    String? statusName,
    num? totalPrice,
    num? reservationId,
    dynamic attendeeInfoId,
    num? typeId,
    num? groupId,
    num? price,
    String? currency,
    String? notes,
    String? title,
    String? titleNumber,
    num? statusId,
  }) {
    return TicketDetailsModel(
      attendee: attendee ?? this.attendee,
      id: id ?? this.id,
      createdOn: createdOn ?? this.createdOn,
      lastUpdatedOn: lastUpdatedOn ?? this.lastUpdatedOn,
      groupTitle: groupTitle ?? this.groupTitle,
      typeName: typeName ?? this.typeName,
      statusName: statusName ?? this.statusName,
      totalPrice: totalPrice ?? this.totalPrice,
      reservationId: reservationId ?? this.reservationId,
      attendeeInfoId: attendeeInfoId ?? this.attendeeInfoId,
      typeId: typeId ?? this.typeId,
      groupId: groupId ?? this.groupId,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      notes: notes ?? this.notes,
      title: title ?? this.title,
      titleNumber: titleNumber ?? this.titleNumber,
      statusId: statusId ?? this.statusId,
    );
  }

  factory TicketDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDetailsModelToJson(this);

  @override
  String toString() {
    return "$attendee, $id, $createdOn, $lastUpdatedOn, $groupTitle, $typeName, $statusName, $totalPrice, $reservationId, $attendeeInfoId, $typeId, $groupId, $price, $currency, $notes, $title, $titleNumber, $statusId, ";
  }

  @override
  List<Object?> get props => [
    attendee,
    id,
    createdOn,
    lastUpdatedOn,
    groupTitle,
    typeName,
    statusName,
    totalPrice,
    reservationId,
    attendeeInfoId,
    typeId,
    groupId,
    price,
    currency,
    notes,
    title,
    titleNumber,
    statusId,
  ];
}
