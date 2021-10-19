import 'package:flutter/material.dart';
import 'package:follow_app/director/landingpage_director.dart';
import 'package:follow_app/mock_login.dart';
import 'package:follow_app/models/actor.dart';
import 'package:follow_app/register.dart';
import 'package:follow_app/signUp.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/signup_IDEmail.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:follow_app/student/landingpage_student.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idNumberEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  late Future<Actor> _login;

  bool _obscureText = true;
  DateTime timeBackPressed = DateTime.now();
  @override
  void initState() {}
  Widget build(BuildContext context) {
    Color myColor;

    getActor() {
      FutureBuilder<Actor>(
          future: _login,
          builder: (context, snapshot) {
            print("sulooodd");
            if (snapshot.hasData) {
              print("actor " + snapshot.data!.actor.toString());
              if (snapshot.data!.actor == "teacher") {
                print("teaaaaaacc");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPageTeach()),
                );
              } else if (snapshot.data!.actor == "learner")
                return LandingPageStud();
              else if (snapshot.data!.actor == "no account") return Login();
            }
            return Login();
          });
    }

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
                        'Please Log in to Your Account',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF48444c),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: idNumberEditingController,
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
                          controller: passwordEditingController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Password',
                              fillColor: Color(0xFF48444c),
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
                        height: 20,
                      ),
                      Material(
                          color: Colors.transparent,
                          child: Container(
                            width: 170,
                            height: 50,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color(0xFF98b4ac),
                                child: InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onTap: () {
                                    print("a");

                                    API_Manager()
                                        .getLogin(
                                            idNumberEditingController.text,
                                            passwordEditingController.text)
                                        .then((response) {
                                      if (response.actor == "teacher") {
                                        Center(
                                            child: CircularProgressIndicator());
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LandingPageStud()),
                                        );
                                        // Navigator.pushAndRemoveUntil(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (BuildContext context) =>
                                        //         LandingPageTeach(),
                                        //   ),
                                        //   (route) => false,
                                        // );
                                      } else if (response.actor == "learner") {
                                        Center(
                                            child: CircularProgressIndicator());
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LPageDirect()),
                                        );
                                      } else if (response.actor ==
                                          "no account") {
                                        Container(
                                            child: CircularProgressIndicator());
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            backgroundColor: Color(0xFF98b4ac),
                                            title: Text(
                                              "Invalid Credentials",
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
                                    });
                                  },
                                  splashColor: Colors.brown[300],
                                )),
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
