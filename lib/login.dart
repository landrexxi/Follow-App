import 'package:flutter/material.dart';
import 'package:follow_app/login_newpass.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/signup_IDEmail.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
// ignore: import_of_legacy_library_into_null_safe

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  late Future<Output> _output;
  @override
  Widget build(BuildContext context) {
    Color myColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                // 659EC7
                Color(0xFF98b4ac),
                Color(0xFF98b4ac),
                Color(0xFF98b4ac),

                // Color(0xFF8A2387),
                // Color(0xffE94057),
                // Color(0xFFF27121),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              ClipRRect(
                child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 130.0,
                    width: 170.0,
                    fit: BoxFit.fill),
              ),
              Text(
                'Follow App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  height: 470,
                  width: 325,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFd8c090),
                            Color(0xFFd8c090), // nude
                            Color(0xFFd8c090),

                            // Color(0xFF1569C7),
                            // Color(0xFFE94057),
                            // Color(0xFFF27121),
                          ]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Hello',
                        style: TextStyle(
                            color: Color(0xFF48444c),
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please Log in to Your Account ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF48444c),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelText: 'Enter ID Number',

                              // labelStyle: TextStyle(color: Colors.black),
                              fillColor: Color(0xFF48444c),
                              suffixIcon: Icon(
                                Icons.phone,
                                size: 17,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Password',
                              fillColor: Color(0xFF48444c),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                size: 17,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPageTeach()),
                              ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF98b4ac),
                                      Color(0xFF98b4ac), // nude
                                      Color(0xFF98b4ac),

                                      // Color(0xFF1569C7),
                                      // Color(0xFFE94057),
                                      // Color(0xFFF27121),
                                    ])),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Log In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signupIDEmail()),
                              ),
                          child: RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'Dont have an account? ',
                                    style: TextStyle(fontSize: 16)),
                                new TextSpan(
                                    text: 'Sign Up',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
