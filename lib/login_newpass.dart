import 'package:flutter/material.dart';
import 'package:follow_app/admin/landingpage_admin.dart';
import 'package:follow_app/councilor/landingpage_councilor.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/models/register.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:follow_app/student/landingpage_student.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:follow_app/main.dart';
import 'package:follow_app/teacher/profile.dart';
import 'package:follow_app/teacher/navbar_teacher.dart';

import 'emailCode.dart';

class LoginNewPass extends StatefulWidget {
  LoginNewPass(
    this.id,
    this.email,
    this.code,
  );
  final String id;
  final String email;
  final String code;
  bool invisible = true;

  @override
  _LoginNewPassState createState() => _LoginNewPassState();
}

class _LoginNewPassState extends State<LoginNewPass> {
  TextEditingController idEditingController = new TextEditingController();
  TextEditingController newPassEditingController = new TextEditingController();
  TextEditingController confirmPassEditingController =
      new TextEditingController();
  late Future<Output> _output;
  late Future<Register> _register;
  @override
  void initState() {
    _output = API_Manager().getVerification(
      widget.id,
      widget.code,
    );
    _register = API_Manager().getRegister();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<Output>(
            future: _output,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.result == true) {
                  return Container(
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
                            height: 500,
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
                                  height: 25,
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
                                  'Register your Account and Reset your Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color(0xFF48444c),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 250,
                                  child: TextField(
                                    controller: idEditingController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'ID Number',
                                        fillColor: Color(0xFF48444c),
                                        suffixIcon: Icon(
                                          Icons.remove_red_eye,
                                          size: 17,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 250,
                                  child: TextFormField(
                                    controller: newPassEditingController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'New Password',
                                        fillColor: Color(0xFF48444c),
                                        suffixIcon: Icon(
                                          Icons.remove_red_eye,
                                          size: 17,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 250,
                                  child: TextFormField(
                                    controller: confirmPassEditingController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Confirm Password',
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
                                    onTap: () {
                                      if (newPassEditingController.text ==
                                          confirmPassEditingController.text) {
                                        FutureBuilder<Register>(
                                            future: _register,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                if (snapshot.data!.username ==
                                                    idEditingController.text) {
                                                  return Login();
                                                } else {
                                                  return Text("apadta");
                                                }
                                              } else {
                                                return Text("baho kag baba");
                                              }
                                            });
                                      } else {
                                        AlertDialog(
                                          content: Text("Password Not Match"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'Done',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.red)),
                                            )
                                          ],
                                        );
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                        child: Text('Register Account',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    )),
                                SizedBox(
                                  height: 12,
                                ),
                                GestureDetector(
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
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
                                              text: 'Already have an account? ',
                                              style: TextStyle(fontSize: 16)),
                                          new TextSpan(
                                              text: 'Login',
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
                  );
                } else {
                  return Container(
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
                          height: 35,
                        ),
                        Expanded(
                          child: Container(
                            height: 450,
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
                                  height: 35,
                                ),
                                Text(
                                  'Invalid Verification',
                                  style: TextStyle(
                                      color: Color(0xFF48444c),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Text(
                                //   'Invalid Verification',
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       color: Color(0xFF48444c),
                                //       fontWeight: FontWeight.bold),
                                // ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => emailCode(
                                                  widget.id, widget.email)),
                                        ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                        child: Text('Input Valid Code',
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  );
                }
              } else {
                print(snapshot.data);
                return Container(
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
                        height: 35,
                      ),
                      Expanded(
                        child: Container(
                          height: 450,
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
                                height: 35,
                              ),
                              Text(
                                'Hello',
                                style: TextStyle(
                                    color: Color(0xFF48444c),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Please be patient',
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Color(0xFF48444c),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(child: CircularProgressIndicator()),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
