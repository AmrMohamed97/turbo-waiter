import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:turbo_waiter/core/networking/api_error_handler.dart';
import 'package:turbo_waiter/core/networking/api_service.dart';
import 'package:turbo_waiter/core/networking/api_urls.dart';

class EnumsRepo {
  final EnumsRemoteImple enumsRemoteImple;

  EnumsRepo({required this.enumsRemoteImple});
  Future<Either<String, AppRemoteEnums>> call({
    required int enumID,
    required String enumName,
  }) async {
    try {
      var result = await enumsRemoteImple.getEnum(
        enumID: enumID,
        enumName: enumName,
      );
      if (result.statusCode == 200) {
        List<AppRemoteEnums> list = [];
        //parsing list
        for (var element in result.data) {
          list.add(AppRemoteEnums.fromJson(element));
        }
        // getTheElement
        if (list.isNotEmpty) {
          if (list.where((element) => element.value == enumID).isNotEmpty) {
            return right(list[0]);
          } else {
            return left("لم يتم العثور على القيمة المطلوبة");
          }
        } else {
          return left("لم يتم العثور على القيمة المطلوبة");
        }
      } else {
        return left(result.data['message'] ?? '');
      }
    } catch (e) {
      return left(ErrorHandler.handle(e).failure.message ?? '');
    }
  }
}

class EnumsRemoteImple {
  final ApiService apiService;

  const EnumsRemoteImple({required this.apiService});
  Future<Response> getEnum({
    required int enumID,
    required String enumName,
  }) async {
    final Response response = await apiService.get(
      endPoint: ApiUrls.enumsUrl + enumName,
    );
    return response;
  }
}

class AppRemoteEnums {
  final int value;
  final String nameEn;
  final String nameAr;

  const AppRemoteEnums({
    required this.value,
    required this.nameEn,
    required this.nameAr,
  });

  factory AppRemoteEnums.fromJson(Map<String, dynamic> json) {
    return AppRemoteEnums(
      value: json['value'] ?? 0,
      nameEn: json['nameEn'] ?? '',
      nameAr: json['nameAr'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'value': value,
    'nameEn': nameEn,
    'nameAr': nameAr,
  };

  @override
  String toString() => 'AppRemoteEnums(value: $value, nameAr: $nameAr)';

  // Optional: for equality checks
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppRemoteEnums &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
