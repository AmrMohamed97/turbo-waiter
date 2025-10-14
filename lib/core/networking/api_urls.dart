class ApiUrls {
  static String baseUrl = "https://tazkarti.runasp.net/api/";
  static String url = "";
  static String login = "user-management/login";
  static String checkTicketValidity = "Ticket/TicketAttendanceRegistration/";
  static const String getTicketData = "Ticket/GetTicketWithAttendee/{id}";
  static const String enumsUrl = "Enums/";
}

class ApiErrors {
  static const String badRequestError = "bad_request_error";
  static const String noContent = "no_content";
  static const String forbiddenError = "Forbidden Error";
  static const String unauthorizedError = "unauthorized_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "default_error";
  static const String cacheError = "cache_error";
  static const String noInternetError = "no_internet_error";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String apiLogicError = "api_logic_error";
  static const String ok = "Ok";
}
