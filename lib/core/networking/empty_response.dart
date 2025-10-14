class EmptyResponse {
  List<Errors>? errors;
  String? message;
  String? title;
  EmptyResponse({this.errors, this.message, this.title});

  EmptyResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
    message = json['message'] ?? json['Message'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['title'] = title;

    return data;
  }
}

class Errors {
  int? code;
  dynamic source;
  dynamic message;

  Errors({this.code, this.source, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    source = json['source'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['source'] = source;
    data['Message'] = message;
    return data;
  }
}
