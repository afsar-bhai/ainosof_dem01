
import 'dart:convert';

CourseResponse courseResponseFromJson(String str) => CourseResponse.fromJson(json.decode(str));

String courseResponseToJson(CourseResponse data) => json.encode(data.toJson());

class CourseResponse {
  List<Course>? data;
  CourseResponse({
    this.data,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) => CourseResponse(
    data: json["data"] == null ? [] : List<Course>.from(json["data"]!.map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Course {
  String? courseId;
  String? name;

  Course({
    this.courseId,
    this.name,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["courseId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "name": name,
  };
}
