import 'package:flutter/material.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/signUp.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/register.dart';
import 'package:follow_app/services/api_manager.dart';
// ignore: import_of_legacy_library_into_null_safe

//INPUT CODE HERE
class Verification extends StatefulWidget {
  final String id;
  final String email;
  Verification(this.id, this.email);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController codeEditingController = new TextEditingController();
  late Future<Output> _outputverification;
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
              Color(0xFF98b4ac),
              Color(0xFF98b4ac),
              Color(0xFF98b4ac),
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
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
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
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kindly input your code here send via Gmail',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF48444c),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: codeEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Code',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.confirmation_number,
                              size: 17,
                            )),
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
                                  API_Manager()
                                      .getVerification(
                                          widget.id, codeEditingController.text)
                                      .then((response) {
                                    if (response.result == true) {
                                      Center(
                                          child: CircularProgressIndicator());
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp(
                                                widget.id,
                                                widget.email,
                                                codeEditingController.text)),
                                      );
                                    } else if (response.result == false) {
                                      Center(
                                          child: CircularProgressIndicator());
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          backgroundColor: Color(0xFF98b4ac),
                                          title: Text(
                                            "Invalid Verification",
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
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Color(0xFFd8c090))),
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
                    // RaisedButton(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(60.0),
                    //   ),
                    //   elevation: 10.0,
                    //   padding: EdgeInsets.all(25),
                    //   highlightColor: Colors.white,
                    //   onPressed: () {
                    //     setState(() {
                    //       showDialog(
                    //         context: context,
                    //         builder: (ctx) => AlertDialog(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(10.0))),
                    //           backgroundColor: Color(0xFF98b4ac),
                    //           title: Text(
                    //             "Invalid Verification",
                    //             style: TextStyle(
                    //               fontSize: 20,
                    //             ),
                    //             textAlign: TextAlign.justify,
                    //           ),
                    //           actions: <Widget>[
                    //             ElevatedButton(
                    //               onPressed: () {
                    //                 signupIDEmail();
                    //                 Navigator.pop(context);
                    //               },
                    //               child: Text(
                    //                 'Try Again',
                    //                 style: TextStyle(fontSize: 18),
                    //               ),
                    //               style: ButtonStyle(
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all<Color>(
                    //                           Color(0xFFd8c090))),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     });
                    //   },
                    //   child: Text(
                    //     'CLICK    ME',
                    //     style: TextStyle(
                    //       color: Colors.grey[800],
                    //       fontSize: 20,
                    //       fontFamily: 'Monoton',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      )),
    );
  }
}
