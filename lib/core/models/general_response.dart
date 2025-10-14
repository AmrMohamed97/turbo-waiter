import 'dart:developer';

class GeneralResponse<T> {
  T? data;
  String? message;
  bool? status;
  GeneralResponse({this.data, this.message, this.status});

  GeneralResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? dataFromJson,
  }) {
    T? parsedData;

    try {
      if (json.containsKey('data')) {
        final rawData = json['data'];

        if (dataFromJson != null) {
          parsedData = dataFromJson(rawData);
        } else {
          // handle primitive or null data
          parsedData = rawData is T ? rawData : null;
        }
      }
    } catch (e, s) {
      log('Error parsing data: $e');
      log(s.toString());
    }
    data = parsedData;
    if (json['message'] != null) {
      message = json['message'] is String
          ? json['message']
          : json['message'].cast<String>();
    }
    status = json['status'];
  }
}

class Data<T> {
  int? pageIndex;
  int? pageSize;
  int? count;
  int? pagesCount;
  int? itemsCount;
  bool? hasPreviousPage;
  bool? hasNextPage;
  T? data;

  Data({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.pagesCount,
    this.itemsCount,
    this.hasPreviousPage,
    this.hasNextPage,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json, T? Function() dataFromJson) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'];
    pagesCount = json['pagesCount'];
    itemsCount = json['itemsCount'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    if (json['data'] != null) {
      // log("json['data] = ${json['data']}");
      data = dataFromJson();
    } else {
      try {
        data = dataFromJson();
      } catch (e) {
        // Handle the case where 'data' is not present or is null
        data = null;
      }
    }
  }

  Map<String, dynamic> toJson(dynamic Function(T? realData) dataToJson) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageIndex'] = pageIndex;
    data['pageSize'] = pageSize;
    data['count'] = count;
    data['pagesCount'] = pagesCount;
    data['itemsCount'] = itemsCount;
    data['hasPreviousPage'] = hasPreviousPage;
    data['hasNextPage'] = hasNextPage;
    if (this.data != null) {
      data['data'] = dataToJson(this.data);
    }
    return data;
  }
}
