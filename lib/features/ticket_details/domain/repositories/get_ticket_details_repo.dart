import 'package:dartz/dartz.dart';
import 'package:turbo_waiter/features/ticket_details/data/models/ticket_details.dart';

abstract class GetTicketDetailsRepo {
  Future<Either<String, TicketDetailsModel>> getTicketDetails({
    required int ticketId,
  });
}
