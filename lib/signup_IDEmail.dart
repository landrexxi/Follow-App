import 'package:flutter/material.dart';
import 'package:follow_app/emailCode.dart';
import 'package:follow_app/login_newpass.dart';
import 'package:follow_app/services/api_manager.dart';
// ignore: import_of_legacy_library_into_null_safe

class signupIDEmail extends StatefulWidget {
  @override
  _signupIDEmailState createState() => _signupIDEmailState();
}

class _signupIDEmailState extends State<signupIDEmail> {
  TextEditingController idEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();

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
                        'Input your credentials here',
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
                          controller: idEditingController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter ID Number',
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
                          controller: emailEditingController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Email',
                              fillColor: Color(0xFF48444c),
                              suffixIcon: Icon(
                                Icons.mail,
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
                                    builder: (context) => emailCode(
                                        idEditingController.text,
                                        emailEditingController.text)),
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
                              child: Text('Submit',
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
        ),
      ),
    );
  }
}
