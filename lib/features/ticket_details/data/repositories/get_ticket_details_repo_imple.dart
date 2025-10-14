import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:turbo_waiter/features/ticket_details/data/datasources/get_remote_ticket_details.dart';
import 'package:turbo_waiter/features/ticket_details/data/models/ticket_details.dart';
import 'package:turbo_waiter/features/ticket_details/domain/repositories/get_ticket_details_repo.dart';

class GetTicketDetailsRepoImple extends GetTicketDetailsRepo {
  final GetRemoteTicketDetails getRemoteTicketDetails;

  GetTicketDetailsRepoImple({required this.getRemoteTicketDetails});
  @override
  Future<Either<String, TicketDetailsModel>> getTicketDetails({
    required int ticketId,
  }) async {
    try {
      final response = await getRemoteTicketDetails.getTicketDetails(ticketId);
      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        return Left(e.response!.data['message']);
      }
      return Left(e.toString());
    }
  }
}
