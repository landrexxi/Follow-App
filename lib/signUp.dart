import 'package:flutter/material.dart';
import 'package:follow_app/admin/landingpage_admin.dart';
import 'package:follow_app/councilor/landingpage_councilor.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/models/actor.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/models/register.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:follow_app/signup_IDEmail.dart';
import 'package:follow_app/student/landingpage_student.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:follow_app/main.dart';
import 'package:follow_app/teacher/profile.dart';
import 'package:follow_app/teacher/navbar_teacher.dart';

import 'verification.dart';

// INPUT ID NUMBER NEW AND CONFIRM PASS
class SignUp extends StatefulWidget {
  SignUp(
    this.id,
    this.email,
    this.code,
  );
  final String id;
  final String email;
  final String code;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController idEditingController = new TextEditingController();
  TextEditingController newPassEditingController = new TextEditingController();
  TextEditingController confirmPassEditingController =
      new TextEditingController();
  late Future<Output> _output;
  late Future<SingUp> _register;
  late Future<Actor> _login;
  bool _obscureText = true;
  bool _obscureText2 = true;
  // bool isHiddenPassword = true;
  @override
  void initState() {
    _output = API_Manager().getVerification(
      widget.id,
      widget.code,
    );
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
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 27,
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                  'Sign Up your Account and Input your Password',
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
                                          Icons.confirmation_number,
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
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'New Password',
                                        fillColor: Color(0xFF48444c),
                                        // LIHOKA NI LAAAAAAAAAAAATER
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: Icon(_obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off),
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
                                    obscureText: _obscureText2,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Confirm Password',
                                        fillColor: Color(0xFF48444c),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText2 = !_obscureText2;
                                            });
                                          },
                                          child: Icon(_obscureText2
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      if (widget.id ==
                                          idEditingController.text) {
                                        if (newPassEditingController.text ==
                                            confirmPassEditingController.text) {
                                          setState(() {
                                            _register = API_Manager()
                                                .postSignUp(
                                                    idEditingController.text,
                                                    confirmPassEditingController
                                                        .text);
                                          });

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()));
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              backgroundColor:
                                                  Color(0xFF98b4ac),
                                              title: Text(
                                                "Password Not Match",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text(
                                                    'Try Again',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Color(
                                                                  0xFFd8c090))),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            backgroundColor: Color(0xFF98b4ac),
                                            title: Text(
                                              "ID Number does not Exist",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text(
                                                  'Try Again',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Color(
                                                                0xFFd8c090))),
                                              ),
                                            ],
                                          ),
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
                                              builder: (context) =>
                                                  Verification(
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

  // void _togglePasswordView() {
  //   var isHiddenPassword;
  //   if (isHiddenPassword == true) {
  //     isHiddenPassword == false;
  //   } else {
  //     isHiddenPassword = true;
  //   }
  //   setState(() {});
  // }
}
