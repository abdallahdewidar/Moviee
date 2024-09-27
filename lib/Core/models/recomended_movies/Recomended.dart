import 'package:movieeapp/Core/CategoryList/Results.dart';

class Recommended {
  Recommended({
      this.page, 
      this.statusCode, 
      this.statusMessage, 
      this.success, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  Recommended.fromJson(dynamic json) {
    page = json['page'];
     statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  num? statusCode;
  String? statusMessage;
  bool? success;
  List<Result>? results;
  num? totalPages;
  num? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}