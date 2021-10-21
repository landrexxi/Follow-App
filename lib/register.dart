import 'package:flutter/material.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/verification.dart';
import 'package:follow_app/signUp.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';

// ignore: import_of_legacy_library_into_null_safe

class signupIDEmail extends StatefulWidget with InputValidationMixin {
  @override
  _signupIDEmailState createState() => _signupIDEmailState();
}

final formGlobalKey = GlobalKey<FormState>();
mixin InputValidationMixin {
  // bool isEmailValid(String email) {
  //   Pattern pattern =
  //     r '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = new RegExp(pattern);
  //   return regex.hasMatch(email);
  // }
}

class _signupIDEmailState extends State<signupIDEmail> {
  TextEditingController idEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();

  // String? _email;

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
                height: 8,
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
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                        height: 45,
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
                      Form(
                        key: formGlobalKey,
                        child: Container(
                          width: 250,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Email',
                                fillColor: Color(0xFF48444c),
                                suffixIcon: Icon(
                                  Icons.mail,
                                  size: 17,
                                )),
                            validator: (email) {
                              if (isEmailValid(email)) {
                                print("OR SA ");
                                return null;
                              } else {
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
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          'Try Again',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Color(0xFFd8c090))),
                                      ),
                                    ],
                                  ),
                                );
                                return 'Enter a valid email address';
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                          color: Colors.transparent,
                          child: Container(
                            width: 180,
                            height: 50,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color(0xFF98b4ac),
                                child: InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onTap: () {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      print('suloood');
                                      formGlobalKey.currentState!.save();
                                      print("save");
                                      API_Manager()
                                          .getRegister(idEditingController.text,
                                              emailEditingController.text)
                                          .then((response) {
                                        if (response.result ==
                                            "Account Created") {
                                          print("naa ka nuber?");
                                          Center(
                                              child:
                                                  CircularProgressIndicator());
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Verification(
                                                        idEditingController
                                                            .text,
                                                        emailEditingController
                                                            .text)),
                                          );
                                        } else if (response.result ==
                                            "Invalid Account") {
                                          print("ARI FALSE?");
                                          Center(
                                              child:
                                                  CircularProgressIndicator());
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
                                                "ID Number does not exist",
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
                                        } else if (response.result ==
                                            "Account is Existing") {
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
                                                "ID Number already exist",
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
                                      // use the email provided here
                                    }
                                  },
                                  splashColor: Colors.brown[300],
                                )),
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

  bool isEmailValid(String? email) {
    print("BOOL EMAIL");

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(email.toString());
  }
}
