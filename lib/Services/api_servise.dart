import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/course_model.dart';
import '../Model/signup_model.dart';
import '../Model/sub_course_model.dart';
import '../Model/verification_response.dart';



class AuthApi {
  static Future<List<Course>?> getCourses() async {
    var response = await http.get(Uri.parse('https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/courses.php'));
    if (response.statusCode == 200) {
      CourseResponse courseResponse =
      CourseResponse.fromJson(jsonDecode(response.body));
      return courseResponse.data;
    }
    return [];
  }
  static Future<List<SubCourse>?> getSubCourses(
      {required String? courseId}) async {
    var response = await http.post(Uri.parse('https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/sub-courses.php'), body: {'course': courseId});

    if (response.statusCode == 200) {
      SubCourseResponse subCourseResponse =
      SubCourseResponse.fromJson(jsonDecode(response.body));
      return subCourseResponse.data;
    }
    return [];
  }
  static Future<VerificationResponse> signUp({required SignUpModel signUpModel}) async {
    var response = await http.post(Uri.parse('https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/signup.php'), body: signUpModel.toJson());

    VerificationResponse verificationResponse =
    VerificationResponse.fromJson(jsonDecode(response.body));
    return verificationResponse;
  }

  static Future<VerificationResponse> verifyOtp(
      {
        required String email, required String otp})
  async {
    var response = await http.post(Uri.parse('https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/verification.php'), body: {'email': email, 'verification_code': otp});
    VerificationResponse verificationResponse =
    VerificationResponse.fromJson(jsonDecode(response.body));
    return verificationResponse;
  }
}