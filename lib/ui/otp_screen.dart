import 'package:ainosof_demo/ui/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../Services/api_servise.dart';




class FourthScreen extends StatefulWidget {
  final String email;
  const FourthScreen({super.key, required this.email});
  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  var _otpController = TextEditingController(); // Controller for the first input field

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF130139),
      appBar: AppBar( leading: BackButton(color: Colors.white,), backgroundColor:const Color(0xFF130139) ,),
      body: SafeArea(
        child: ListView(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 70,left: 10),
            //   child: Align(alignment: Alignment.bottomLeft,child: Icon(CupertinoIcons.arrow_left,color: Colors.white,size: 50,)),
            // ),
            const SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.mail_solid,color: Colors.white,size: 55,),
                SizedBox(height: screenHeight*0.02,),
                Text("We have Send code",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20)),
                Text("Number To Your Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20)),
                SizedBox(height: screenHeight*0.02,),
                Text("Lorem ipsum dolors sit amet",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15)),
                Text("consecture adipiscing elit,sed do",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15)),
                Text("eiusmod tempore incididunt ut labore",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize:15)),
                Text("et dolore mange aliqua.Ut",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15)),
                SizedBox(height: screenHeight*0.02,),
                Center(
                  child: SizedBox(
                    width: 300, // Set the desired width
                    height: 60, // Set the desired height
                    child: Pinput(
                      controller: _otpController,
                      length: 4,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      // Add other properties as needed
                    ),
                  ),
                ),

                SizedBox(height: screenHeight*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Haven't received email?", style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("Send Email Again", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                  ],
                ),
                SizedBox(height: screenHeight*0.12,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () async{
                      var resp = await AuthApi.verifyOtp(email: widget.email, otp: _otpController.text);
                      if(resp.status == true){
                        sowSnack(context, resp.message ?? "success");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      }else{
                        sowSnack(context, resp.message ?? "Failed");
                      }
                    },
                    child: Row(
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
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        backgroundColor: Color(0xffe35c04),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  void sowSnack(BuildContext context,String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}