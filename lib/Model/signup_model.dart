class SignUpModel {
  String name;
  String email;
  String mobile;
  String course;
  String subCourse;

  SignUpModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.course,
    required this.subCourse,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'mobile': mobile,
    'course': course,
    'sub_course': subCourse,
  };
}
