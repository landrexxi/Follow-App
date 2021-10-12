import 'package:flutter/material.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/login_newpass.dart';
// ignore: import_of_legacy_library_into_null_safe

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController idEditingController = new TextEditingController();
  TextEditingController password1EditingController =
      new TextEditingController();
  TextEditingController password2EditingController =
      new TextEditingController();
  String wcText =
      """Follow App is an application for student counseling. Where the teachers can refer students online.  Guidance Counselors will then be notified, subject teachers of the referred student will also be notified to give feedback on the student’s grades, attendance ,academic performances and other informations 
.""";

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
                    height: 160.0,
                    width: 190.0,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  wcText,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
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
                              Color(0xFFd8c090),
                              Color(0xFFd8c090), // nude
                              Color(0xFFd8c090),

                              // Color(0xFF1569C7),
                              // Color(0xFFE94057),
                              // Color(0xFFF27121),
                            ])),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Click here to start',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
