import 'package:flutter/material.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/signUp.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/signup_IDEmail.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:follow_app/student/landingpage_student.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:follow_app/verification.dart';

import 'models/actor.dart';
// ignore: import_of_legacy_library_into_null_safe

//INPUT CODE HERE
class MockLogin extends StatefulWidget {
  final String id;
  final String pass;
  MockLogin(this.id, this.pass);

  @override
  _MockLoginState createState() => _MockLoginState();
}

class _MockLoginState extends State<MockLogin> {
  TextEditingController codeEditingController = new TextEditingController();
  late Future<Actor> _login;
  @override
  void initState() {
    _login = API_Manager().getLogin(widget.id, widget.pass);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: FutureBuilder<Actor>(
            future: _login,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("hoy");
                print("actor " + snapshot.data!.actor.toString());
                if (snapshot.data!.actor == "teacher") {
                  print("teaaaaaacc");
                  return LandingPageTeach();
                } else if (snapshot.data!.actor == "learner") {
                  return LandingPageStud();
                } else if (snapshot.data!.actor == "no account") {
                  // showDialog(
                  //   context: context,
                  //   builder: (ctx) => AlertDialog(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(10.0))),
                  //     backgroundColor: Color(0xFF98b4ac),
                  //     title: Text(
                  //       "Account Invalid",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //       textAlign: TextAlign.justify,
                  //     ),
                  //     actions: <Widget>[
                  //       ElevatedButton(
                  //         onPressed: () => Navigator.push(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => Login()),
                  //         ),
                  //         child: Text(
                  //           'Try Again',
                  //           style: TextStyle(fontSize: 18),
                  //         ),
                  //         style: ButtonStyle(
                  //             backgroundColor: MaterialStateProperty.all<Color>(
                  //                 Color(0xFFd8c090))),
                  //       ),
                  //     ],
                  //   ),
                  // );
                  return Login();
                }
              }
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
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              );
            }));
  }
}
