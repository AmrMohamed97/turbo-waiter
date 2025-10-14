part of 'ticket_details_cubit.dart';

abstract class TicketDetailsState extends Equatable {
  const TicketDetailsState();

  @override
  List<Object> get props => [];
}

class TicketDetailsInitial extends TicketDetailsState {}

class TicketDetailsLoading extends TicketDetailsState {}

class TicketDetailsLoaded extends TicketDetailsState {
  final TicketDetailsModel ticketDetails;
  const TicketDetailsLoaded({required this.ticketDetails});
  @override
  List<Object> get props => [ticketDetails];
}

class TicketDetailsError extends TicketDetailsState {
  final String errorMessage;
  const TicketDetailsError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
