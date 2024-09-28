import 'package:movieeapp/Core/CategoryList/Results.dart';
import 'package:movieeapp/Core/models/new_relases/Dates.dart';

class Upcoming {
  Upcoming({
      this.dates, 
      this.statusCode, 
      this.statusMessage, 
      this.success,
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  Upcoming.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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
  Dates? dates;
  num? page;
  List<Result>? results;
  num? totalPages;
  num? totalResults;
  num? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
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