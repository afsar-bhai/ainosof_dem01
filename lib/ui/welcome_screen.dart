import 'package:ainosof_demo/ui/register_screen.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_lorem/flutter_lorem.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Color customColor = Color.fromRGBO(19, 1, 57, 1.0);

  // String text = lorem(paragraphs: 2, words: 60);
  final loremText = '''
    Lorem ipsum dolor sit amet,
    consectetur adipiscing elit.
    Sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua. ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: SizedBox(
                    // height: MediaQuery.of(context).size.height * .300,

                    child: Image.asset(
                      'assets/white-logo.png',
                      height: 150,
                      width: 200,
                      // height: 70,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Thynk',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Unlimited',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              // Text('Wait For Second...',style: TextStyle(color: Colors.white,fontSize: 20,),),
              // const SizedBox(
              //   height: 15,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * .650,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            color: customColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, right: 30, top: 10),
                      child: Text(
                        loremText, // Display Lorem Ipsum text
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only (left: 10.0,right: 10),
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Get Started >',
                            style: TextStyle(color: customColor),
                          ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(340, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: customColor,  width: 4.0,),// Add border radius
                          ),// Set button size
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(160, 40), // Increase width
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Add border radius
                              ),// Set background color
                            ),
                            child: Text('Login'),
                          ),
                          SizedBox(height: 80), // Add some spacing between buttons
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(160, 40), // Increase width
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Add border radius
                              ),// Set background color
                            ),
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   LoremText.words(50), // Generate 50 random Lorem Ipsum words
                    //   style: TextStyle(
                    //     fontSize: 16.0,
                    //   ),
                    // )

                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
