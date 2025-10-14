import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turbo_waiter/features/ticket_details/data/models/ticket_details.dart';
import 'package:turbo_waiter/features/ticket_details/domain/repositories/get_ticket_details_repo.dart';

part 'ticket_details_state.dart';

class TicketDetailsCubit extends Cubit<TicketDetailsState> {
  TicketDetailsCubit({required this.id, required this.getTicketDetailsRepo})
    : super(TicketDetailsInitial()) {
    getTicketDetails();
  }
  final int id;
  final GetTicketDetailsRepo getTicketDetailsRepo;

  Future<void> getTicketDetails() async {
    emit(TicketDetailsLoading());
    final result = await getTicketDetailsRepo.getTicketDetails(ticketId: id);
    result.fold(
      (l) => emit(TicketDetailsError(errorMessage: l)),
      (r) => emit(TicketDetailsLoaded(ticketDetails: r)),
    );
  }
}
