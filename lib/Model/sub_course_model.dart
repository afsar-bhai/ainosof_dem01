
import 'dart:convert';

SubCourseResponse subCourseResponseFromJson(String str) => SubCourseResponse.fromJson(json.decode(str));

String subCourseResponseToJson(SubCourseResponse data) => json.encode(data.toJson());

class SubCourseResponse {
  List<SubCourse>? data;

  SubCourseResponse({
    this.data,
  });

  factory SubCourseResponse.fromJson(Map<String, dynamic> json) => SubCourseResponse(
    data: json["data"] == null ? [] : List<SubCourse>.from(json["data"]!.map((x) => SubCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubCourse {
  String? subcourseId;
  String? courseId;
  String? name;

  SubCourse({
    this.subcourseId,
    this.courseId,
    this.name,
  });

  factory SubCourse.fromJson(Map<String, dynamic> json) => SubCourse(
    subcourseId: json["subcourseId"],
    courseId: json["courseId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "subcourseId": subcourseId,
    "courseId": courseId,
    "name": name,
  };
}
