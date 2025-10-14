import 'package:dio/dio.dart';
import 'package:turbo_waiter/core/networking/api_urls.dart';
import 'package:turbo_waiter/features/ticket_details/data/models/ticket_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'get_remote_ticket_details.g.dart';

abstract class GetRemoteTicketDetails {
  Future<TicketResponseModel> getTicketDetails(int id);
}

@RestApi()
abstract class GetRemoteTicketDetailsImple implements GetRemoteTicketDetails {
  factory GetRemoteTicketDetailsImple(Dio dio, {String baseUrl}) =
      _GetRemoteTicketDetailsImple;

  @override
  @GET(ApiUrls.getTicketData)
  Future<TicketResponseModel> getTicketDetails(@Path("id") int id);
}
