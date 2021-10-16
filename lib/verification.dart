import 'package:flutter/material.dart';
import 'package:follow_app/login.dart';
import 'package:follow_app/signUp.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/signup_IDEmail.dart';
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
  void initState() {
    _outputverification = API_Manager().getRegister(widget.id, widget.email);
    super.initState();
  }

  Widget build(BuildContext context) {
    // String idstore = "";
    // String emailstore = "";
    // idstore = widget.id;
    // emailstore = widget.email;

    Color myColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<Output>(
            future: _outputverification,
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
                                GestureDetector(
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp(
                                                  widget.id,
                                                  widget.email,
                                                  codeEditingController.text)),
                                        ),
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
                            height: 100,
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
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'ID Number and Email does not exist',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF48444c),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                    onTap: () => Navigator.pop(context),
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
                                        child:
                                            Text('Please input valid details',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
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
              } else
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
            },
          ),
        ),
      ),
    );
  }
}
