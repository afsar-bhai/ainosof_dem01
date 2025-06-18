import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Model/course_model.dart';
import '../Model/signup_model.dart';
import '../Model/sub_course_model.dart';
import '../Services/api_servise.dart';
import 'otp_screen.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();

  Course? selectedCourse;
  SubCourse? selectedSubCourse;
  List<Course> courseList=[];
  List<SubCourse>  subcourseList=[];
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0039),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              margin: EdgeInsets.only(top: 70, left: 10),
              child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Create your',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              'Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Name:',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter name',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Email Address:',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.go,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Contact:',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: mobileController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                maxLength: 10,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter mobile no.',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Course:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<Course>(
                          value: selectedCourse,
                          items: courseList.map<DropdownMenuItem<Course>>((Course value) {
                            return DropdownMenuItem<Course>(
                              value: value,
                              child: Text(
                                value.name ?? "course",
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (course) async {
                            setState(() {
                              selectedCourse = course ?? Course();
                              // Clear selected subcourse when changing course
                              selectedSubCourse = null;
                            });
                            if (selectedCourse?.courseId != null) {
                              await onCourseSelect(selectedCourse?.courseId);
                            }
                          },
                          // Add a key to uniquely identify the DropdownButton
                          key: UniqueKey(),
                          hint: Text(
                            'Choose Course',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sub Course:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<SubCourse>(
                          value: selectedSubCourse,
                          items: subcourseList.map<DropdownMenuItem<SubCourse>>((SubCourse value) {
                            return DropdownMenuItem<SubCourse>(
                              value: value,
                              child: Text(
                                value.name ?? "subcourse",
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (subCourse) {
                            setState(() {
                              selectedSubCourse = subCourse ?? SubCourse();
                            });
                          },
                          // Add a key to uniquely identify the DropdownButton
                          key: UniqueKey(),
                          hint: Text(
                            'Choose SubCourse',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                ),

            const SizedBox(
              height: 13,
            ),
            const Text(
              'Password:',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),


            const SizedBox(
              height: 13,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Already Have Account?',
                  style: TextStyle(color: Colors.white60),
                ),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async{
                if(nameController.text.isEmpty) {
                  sowSnack(context,'Please Enter name');
                }else if(emailController.text.isEmpty){
                  sowSnack(context,'Please Enter Email');
                } else if(mobileController.text.isEmpty){
                  sowSnack(context,'Please Enter Mobile');
                }
                else if(selectedCourse == null){
                  sowSnack(context,'Please Select Course');
                }
                else if(selectedSubCourse == null){
                  sowSnack(context,'Please Select Sub Course');
                }
                else{
                  var signupModel = SignUpModel(name: nameController.text, email: emailController.text, mobile: mobileController.text, course: selectedCourse?.courseId ?? "", subCourse: selectedSubCourse?.subcourseId ?? "");
                  var resp = await AuthApi.signUp(signUpModel: signupModel);
                  if(resp.status == true){
                    sowSnack(context,resp.message ?? "success");
                   }else{
                    sowSnack(context,resp.message ?? "Failed to Signup");
                  }
                }
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FourthScreen(email:emailController.text)));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  backgroundColor: Color(0xffe35c04),
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(17))),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.right_chevron,
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> getData() async{
    var courses = await  AuthApi.getCourses();
    courseList= courses ?? [];
    if(courseList.isNotEmpty){
      await onCourseSelect(courseList.first.courseId);
    }
    else{
      setState(() {});
    }
  }

  Future<void> onCourseSelect(String? courseId) async{
    selectedSubCourse  = null;
    var subCourses = await AuthApi.getSubCourses(courseId:courseId);
    subcourseList = subCourses ?? [];
    setState(() {});
  }

  void sowSnack(BuildContext context,String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

}