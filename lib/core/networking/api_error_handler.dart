// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/networking/empty_response.dart';
import 'api_urls.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  API_LOGIC_ERROR,
  DEFAULT,
}

class ResponseCode {
  ///200
  static const int SUCCESS = 200; // success with data
  ///201
  static const int NO_CONTENT = 201; // success with no data (no content)
  ///400
  static const int BAD_REQUEST = 400; // failure, API rejected request
  ///401
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  ///403
  static const int FORBIDDEN = 403; //  failure, API rejected request
  ///500
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  ///404
  static const int NOT_FOUND = 404; // failure, not found
  ///422
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = ApiErrors.ok; // success with data
  static const String NO_CONTENT =
      ApiErrors.ok; // success with no data (no content)
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String UNAUTHORIZED =
      ApiErrors.unauthorizedError; // failure, user is not authorized
  static String FORBIDDEN =
      AppTexts.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side
  static const String API_LOGIC_ERROR =
      ApiErrors.apiLogicError; // API , lOGIC ERROR

  // local status code
  static const String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static const String CANCEL = ApiErrors.defaultError;
  static const String RECEIVE_TIMEOUT = ApiErrors.timeoutError;
  static const String SEND_TIMEOUT = ApiErrors.timeoutError;
  static const String CACHE_ERROR = ApiErrors.cacheError;
  static const String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static const String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  EmptyResponse getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.SUCCESS,
              message: ResponseMessage.SUCCESS.tr(),
            ),
          ],
        );
      case DataSource.NO_CONTENT:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.NO_CONTENT,
              message: ResponseMessage.NO_CONTENT.tr(),
            ),
          ],
          message: ResponseMessage.NO_CONTENT.tr(),
        );
      case DataSource.BAD_REQUEST:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.BAD_REQUEST,
              message: ResponseMessage.BAD_REQUEST.tr(),
            ),
          ],
          message: ResponseMessage.BAD_REQUEST.tr(),
        );
      case DataSource.FORBIDDEN:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.FORBIDDEN,
              message: ResponseMessage.FORBIDDEN.tr(),
            ),
          ],
          message: ResponseMessage.FORBIDDEN.tr(),
        );
      case DataSource.UNAUTHORIZED:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.UNAUTHORIZED,
              message: ResponseMessage.UNAUTHORIZED.tr(),
            ),
          ],
          message: ResponseMessage.UNAUTHORIZED.tr(),
        );
      case DataSource.NOT_FOUND:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.NOT_FOUND,
              message: ResponseMessage.NOT_FOUND.tr(),
            ),
          ],
          message: ResponseMessage.NOT_FOUND.tr(),
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.INTERNAL_SERVER_ERROR,
              message: ResponseMessage.INTERNAL_SERVER_ERROR.tr(),
            ),
          ],
          message: ResponseMessage.INTERNAL_SERVER_ERROR.tr(),
        );
      case DataSource.CONNECT_TIMEOUT:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.CONNECT_TIMEOUT,
              message: ResponseMessage.CONNECT_TIMEOUT.tr(),
            ),
          ],
          message: ResponseMessage.CONNECT_TIMEOUT.tr(),
        );
      case DataSource.CANCEL:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.CANCEL,
              message: ResponseMessage.CANCEL.tr(),
            ),
          ],
          message: ResponseMessage.CANCEL.tr(),
        );
      case DataSource.RECEIVE_TIMEOUT:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.RECEIVE_TIMEOUT,
              message: ResponseMessage.RECEIVE_TIMEOUT.tr(),
            ),
          ],
          message: ResponseMessage.RECEIVE_TIMEOUT.tr(),
        );
      case DataSource.SEND_TIMEOUT:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.SEND_TIMEOUT,
              message: ResponseMessage.SEND_TIMEOUT.tr(),
            ),
          ],
          message: ResponseMessage.SEND_TIMEOUT.tr(),
        );
      case DataSource.CACHE_ERROR:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.CACHE_ERROR,
              message: ResponseMessage.CACHE_ERROR.tr(),
            ),
          ],
          message: ResponseMessage.CACHE_ERROR.tr(),
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.NO_INTERNET_CONNECTION,
              message: ResponseMessage.NO_INTERNET_CONNECTION.tr(),
            ),
          ],
          message: ResponseMessage.NO_INTERNET_CONNECTION.tr(),
        );
      case DataSource.API_LOGIC_ERROR:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.API_LOGIC_ERROR,
              message: ResponseMessage.API_LOGIC_ERROR.tr(),
            ),
          ],
          message: ResponseMessage.API_LOGIC_ERROR.tr(),
        );
      case DataSource.DEFAULT:
        return EmptyResponse(
          errors: [
            Errors(
              code: ResponseCode.DEFAULT,
              message: ResponseMessage.DEFAULT.tr(),
            ),
          ],
          message: ResponseMessage.DEFAULT.tr(),
        );
    }
  }
}

EmptyResponse _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();

    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.data != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        if (error.response?.statusCode == 500) {
          return EmptyResponse(
            errors: [
              Errors(
                message:
                    error.response?.data['message'] ??
                    error.response?.data['Message'],
                // code: error.response?.data['status'],
              ),
            ],
            message:
                error.response?.data['message'] ??
                error.response?.data['Message'],
          );
        } else if (error.response?.statusCode == 403) {
          return DataSource.FORBIDDEN.getFailure();
        }
        return EmptyResponse(
          errors: [
            Errors(
              message: error.response?.data is String
                  ? error.response?.data
                  : error.response?.data['message'] ??
                        error.response?.data['Message'],
              code: error.response?.data is String
                  ? error.response?.statusCode
                  : error.response?.statusCode,
            ),
          ],
          message: error.response?.data is String
              ? error.response?.data
              : error.response?.data['message'] ??
                    error.response?.data['Message'],
          title: error.response?.data is String
              ? error.response?.data
              : error.response?.data['message'] ??
                    error.response?.data['Message'],
        );
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    default:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return EmptyResponse(
          errors: [
            Errors(
              // message: error.response?.statusMessage ?? "",
              code: error.response?.statusCode ?? 0,
            ),
          ],
          message: error.response?.statusMessage ?? "",
        );
      } else {
        return DataSource.DEFAULT.getFailure();
      }
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

class ErrorHandler implements Exception {
  late EmptyResponse failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

// // Define a type alias for the API call function
// typedef ApiCall<T> = Future<dynamic> Function();
// // Generic wrapper for API calls
// Future<Either<EmptyResponse, GeneralResponse<T>>> executeApiCall<T>(
//   ApiCall apiCall, { // The data source function to call
//   required T Function(dynamic) parser, // Function to parse the response data
//   bool withPage = false,
//   bool isDataInData = false,
// }) async {
//   try {
//     final result = await apiCall();
//     // Check if the response is successful
//     if (result.data != null &&
//             (result.data['success'] != null && result.data['success']) ||
//         (result.data['Success'] != null && result.data['Success'])) {
//       return Right(
//         GeneralResponse<T>.fromJson(
//           result.data,
//           () => parser(
//             isDataInData
//                 ? result.data['data']['data']['data']
//                 : withPage
//                 ? result.data['data']['data']
//                 : result.data['data'],
//           ),
//           withPage: withPage,
//         ),
//       );
//     } else {
//       String errorMessage =
//           result.data['message'] ?? result.data['Message'] ?? "Unknown error";
//       return Left(EmptyResponse(message: errorMessage));
//     }
//   } on DioException catch (e) {
//     // String errorMessage =
//     //     e.response?.data['message'] ??
//     //     e.response?.data['Message'] ??
//     //     "Unknown error";
//     // return Left(EmptyResponse(message: errorMessage));
//     return Left(ErrorHandler.handle(e).failure);
//   } on FormatException catch (e) {
//     return Left(EmptyResponse(message: e.message));
//   } catch (e, s) {
//     log(e.toString());
//     log(s.toString());
//     return Left(EmptyResponse(message: e.toString()));
//   }
// }
